//
//  ProductDetailProtocols.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol ProductDetailDisplayable: class {
    func displayGetProductDetail(viewModel: ProductDetail.GetProductDetail.ViewModel)
}

//MARK: Interactor
protocol ProductDetailBusinessLogic {
    func getProductDetail(request: ProductDetail.GetProductDetail.Request)
}

//MARK: Presenter
protocol ProductDetailPresentable {
    func presentGetProductDetail(response: ProductDetail.GetProductDetail.Response)
}

//MARK: Routable
protocol ProductDetailRoutable {
    
}

//MARK: DataStore
protocol ProductDetailDataStore {
    var productId: Int { get set }
}

//MARK: DataPassing
protocol ProductDetailDataPassing {
    var dataStore: ProductDetailDataStore? { get set }
}
