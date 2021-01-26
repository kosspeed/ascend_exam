//
//  ProductPresenter.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit

class ProductPresenter {
    private weak var displayable: ProductDisplayable?
    
    init(displayable: ProductDisplayable) {
        self.displayable = displayable
    }
}

//MARK: Presentable
extension ProductPresenter: ProductPresentable {
    func presentGetProducts(response: Product.GetProduct.Response) {
        var productCells: [ProductCell]?
        let placeholderImage = UIImage(named: "icon_ph")
        
        if let products = response.products {
            productCells = products.compactMap {
                ProductCell(id: $0.id,
                            title: $0.title,
                            image: URL(string: $0.image ?? ""),
                            hiddenNewTag: !$0.isNewProduct,
                            price: $0.price.rounded(toPlaces: 2).description,
                            placeholderImage: placeholderImage)
            }
        }
        
        displayable?.displayGetProducts(viewModel: .init(status: response.status,
                                                         productCells: productCells))
    }
}
