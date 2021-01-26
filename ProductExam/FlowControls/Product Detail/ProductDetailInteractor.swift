//
//  ProductDetailInteractor.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

class ProductDetailInteractor: ProductDetailDataStore {
    var presenter: ProductDetailPresentable
    
    private var useCase: GetProductDetailUseCase
    
    var productId: Int
    
    init(presenter: ProductDetailPresentable) {
        self.presenter = presenter
        
        useCase = GetProductDetailUseCaseImpl()
        
        productId = 0
    }
}

//MARK: BusinessLogic
extension ProductDetailInteractor: ProductDetailBusinessLogic {
    func getProductDetail(request: ProductDetail.GetProductDetail.Request) {
        useCase.execute(id: productId, completion: { [weak self] (product) in
            self?.presenter.presentGetProductDetail(response: .init(status: .success,
                                                                    product: product))
        }, failure: { [weak self] (error) in
            self?.presenter.presentGetProductDetail(response: .init(status: .failure,
                                                                    product: nil))
        })
    }
}
