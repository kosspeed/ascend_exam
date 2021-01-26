//
//  ProductPresenterTests.swift
//  ProductExamTests
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

@testable import ProductExam
import XCTest

class ProductPresenterTests: XCTestCase {

    var sut: ProductPresenter!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_presentGetProductsSuccess() {
        let spy = ProductDisplayableSpy()
        sut = ProductPresenter(displayable: spy)
        
        sut.presentGetProducts(response: .init(status: .success, products: []))
        
        XCTAssert(spy.displayGetProductsCalled)
    }
    
    func test_presentGetProductsFailure() {
        let spy = ProductDisplayableSpy()
        sut = ProductPresenter(displayable: spy)
        
        sut.presentGetProducts(response: .init(status: .failure, products: nil))
        
        XCTAssert(spy.displayGetProductsCalled)
    }

}

extension ProductPresenterTests {
    class ProductDisplayableSpy: ProductDisplayable {
        var displayGetProductsCalled = false
        
        func displayGetProducts(viewModel: Product.GetProduct.ViewModel) {
            displayGetProductsCalled = true
        }
    }
}
