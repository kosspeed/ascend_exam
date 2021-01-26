//
//  ProductDetailRouter.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit

class ProductDetailRouter:  ProductDetailDataPassing {
    private weak var viewController: ProductDetailViewController?
    var dataStore: ProductDetailDataStore?
    
    init(viewController: ProductDetailViewController) {
        self.viewController = viewController
    }
}

//MARK: Routable
extension ProductDetailRouter: ProductDetailRoutable {
    
}
