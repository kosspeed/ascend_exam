//
//  ProductInteractor.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

class ProductInteractor: ProductDataStore {
    var presenter: ProductPresentable
    
    var useCase: GetProductUseCase
    
    init(presenter: ProductPresentable) {
        self.presenter = presenter
        
        useCase = GetProductUseCaseImpl()
    }
}

//MARK: BusinessLogic
extension ProductInteractor: ProductBusinessLogic {
    func getProducts(request: Product.GetProduct.Request) {
        useCase.execute(completion: { [weak self] (products) in
            let status: Product.GetProduct.GetProductStatus = products.count > 0 ? .success : .empty
            
            self?.presenter.presentGetProducts(response: .init(status: status,
                                                         products: products))
        }, failure: { [weak self] (error) in
            self?.presenter.presentGetProducts(response: .init(status: .failure,
                                                         products: nil))
        })
    }
}
