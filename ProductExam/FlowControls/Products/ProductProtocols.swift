//
//  ProductProtocols.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

//MARK: ViewController
protocol ProductDisplayable: class {
    func displayGetProducts(viewModel: Product.GetProduct.ViewModel)
}

//MARK: Interactor
protocol ProductBusinessLogic {
    func getProducts(request: Product.GetProduct.Request)
}

//MARK: Presenter
protocol ProductPresentable {
    func presentGetProducts(response: Product.GetProduct.Response)
}

//MARK: Routable
protocol ProductRoutable {
    func routeToProductDetail(id: Int)
}

//MARK: DataStore
protocol ProductDataStore {
    
}

//MARK: DataPassing
protocol ProductDataPassing {
    var dataStore: ProductDataStore? { get set }
}
