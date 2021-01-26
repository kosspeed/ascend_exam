//
//  ProductDetailPresenterTests.swift
//  ProductExamTests
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

@testable import ProductExam
import XCTest

class ProductDetailPresenterTests: XCTestCase {
    var sut: ProductDetailPresenter!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_presentGetProductDetailSuccess() {
        let spy = ProductDetailDisplayableSpy()
        sut = ProductDetailPresenter(displayable: spy)
        
        sut.presentGetProductDetail(response: .init(status: .success, product: .init()))
        
        XCTAssert(spy.displayGetProductDetailCalled)
    }
    
    func test_presentGetProductDetailFailure() {
        let spy = ProductDetailDisplayableSpy()
        sut = ProductDetailPresenter(displayable: spy)
        
        sut.presentGetProductDetail(response: .init(status: .failure, product: nil))
        
        XCTAssert(spy.displayGetProductDetailCalled)
    }
}

extension ProductDetailPresenterTests {
    class ProductDetailDisplayableSpy: ProductDetailDisplayable {
        var displayGetProductDetailCalled = false
        
        func displayGetProductDetail(viewModel: ProductDetail.GetProductDetail.ViewModel) {
            displayGetProductDetailCalled = true
        }
    }
}
