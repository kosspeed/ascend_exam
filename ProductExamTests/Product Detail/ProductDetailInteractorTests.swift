//
//  ProductDetailInteractorTests.swift
//  ProductExamTests
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

@testable import ProductExam
import XCTest

class ProductDetailInteractorTests: XCTestCase {

    var sut: ProductDetailInteractor!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_getProductDetailSuccess() {
        let spy = ProductDetailPresentableSpy()
        let stub = StubGetProductDetailUseCaseImpl(result: .success)
        
        sut = ProductDetailInteractor(presenter: spy)
        sut.useCase = stub
        
        sut.getProductDetail(request: .init())
        
        XCTAssert(spy.presentGetProductDetailCalled)
    }
    
    func test_getProductDetailError() {
        let spy = ProductDetailPresentableSpy()
        let stub = StubGetProductDetailUseCaseImpl(result: .error)
        
        sut = ProductDetailInteractor(presenter: spy)
        sut.useCase = stub
        
        sut.getProductDetail(request: .init())
        
        XCTAssert(spy.presentGetProductDetailCalled)
    }
}

//Spy
extension ProductDetailInteractorTests {
    class ProductDetailPresentableSpy: ProductDetailPresentable {
        var presentGetProductDetailCalled = false
        
        func presentGetProductDetail(response: ProductDetail.GetProductDetail.Response) {
            presentGetProductDetailCalled = true
        }
    }
}

// Stub
extension ProductDetailInteractorTests {
    class StubGetProductDetailUseCaseImpl: GetProductDetailUseCaseImpl  {
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
        
        override func execute(id: Int, completion: @escaping ((ProductEntity) -> Void), failure: @escaping ((Error) -> Void)) {
            switch result {
            case .success:
                completion(.init())
            case .error:
                return failure(ServiceError.unknown)
            }
        }
    }
}

