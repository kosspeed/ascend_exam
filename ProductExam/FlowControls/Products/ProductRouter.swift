//
//  ProductRouter.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit

class ProductRouter:  ProductDataPassing {
    private weak var viewController: ProductViewController?
    var dataStore: ProductDataStore?
    
    init(viewController: ProductViewController) {
        self.viewController = viewController
    }
}

//MARK: Routable
extension ProductRouter: ProductRoutable {
    func routeToProductDetail(id: Int) {
        guard let destinationViewController = ProductDetailViewController.make() else { return }
        destinationViewController.router.dataStore?.productId = id
        
        viewController?.navigationController?.pushViewController(destinationViewController, animated: true)
    }
}
