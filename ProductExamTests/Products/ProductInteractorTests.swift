//
//  ProductInteractorTests.swift
//  ProductExamTests
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

@testable import ProductExam
import XCTest

class ProductInteractorTests: XCTestCase {

    var sut: ProductInteractor!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_getProductSuccess() {
        let spy = ProductPresentableSpy()
        let stub = StubGetProductUseCaseImpl(result: .success)
        
        sut = ProductInteractor(presenter: spy)
        sut.useCase = stub
        
        sut.getProducts(request: .init())
        
        XCTAssert(spy.presentGetProductsCalled)
    }
    
    func test_getProductError() {
        let spy = ProductPresentableSpy()
        let stub = StubGetProductUseCaseImpl(result: .error)
        
        sut = ProductInteractor(presenter: spy)
        sut.useCase = stub
        
        sut.getProducts(request: .init())
        
        XCTAssert(spy.presentGetProductsCalled)
    }
}

//Spy
extension ProductInteractorTests {
    class ProductPresentableSpy: ProductPresentable {
        var presentGetProductsCalled = false
        
        func presentGetProducts(response: Product.GetProduct.Response) {
            presentGetProductsCalled = true
        }
    }
}

// Stub
extension ProductInteractorTests {
    class StubGetProductUseCaseImpl: GetProductUseCaseImpl  {
        enum Results: String {
            case success
            case error
        }
        
        enum ServiceError: Error {
            case unknown
        }
        
        private let result: Results
        
        init(result: Results) {
            self.result = result
        }
        
        override func execute(completion: @escaping (([ProductEntity]) -> Void), failure: @escaping ((Error) -> Void)) {
            switch result {
            case .success:
                completion([])
            case .error:
                return failure(ServiceError.unknown)
            }
        }
    }
}

