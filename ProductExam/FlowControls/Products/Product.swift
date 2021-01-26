//
//  Product.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit

typealias ProductCell = Product.GetProduct.ProductCell

struct Product {
    
    //MARK: Use Cases
    struct GetProduct {
        struct Request {
            
        }
        
        struct Response {
            let status: GetProductStatus
            let products: [ProductEntity]?
        }
        
        struct ViewModel {
            let status: GetProductStatus
            let productCells: [ProductCell]?
        }
        
        enum GetProductStatus {
            case success
            case empty
            case failure
        }
        
        struct ProductCell {
            var id: Int
            var title: String?
            var image: URL?
            var hiddenNewTag: Bool
            var price: String?
            var placeholderImage: UIImage?
        }
    }
}
