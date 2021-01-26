//
//  ProductDetailPresenter.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit

class ProductDetailPresenter {
    private weak var displayable: ProductDetailDisplayable?
    
    init(displayable: ProductDetailDisplayable) {
        self.displayable = displayable
    }
}

//MARK: Presentable
extension ProductDetailPresenter: ProductDetailPresentable {
    func presentGetProductDetail(response: ProductDetail.GetProductDetail.Response) {
        var productInformation: ProductInformation?
        
        if let product = response.product {
            productInformation = ProductInformation(id: product.id,
                                                    title: product.title,
                                                    image: URL(string: product.image ?? ""),
                                                    hiddenNewTag: !product.isNewProduct,
                                                    description: product.content,
                                                    price: product.price.rounded(toPlaces: 2).description,
                                                    placeholderImage: UIImage(named: "icon_ph"))
        }
        
        displayable?.displayGetProductDetail(viewModel: .init(status: response.status,
                                                              productInformation: productInformation))
    }
}
