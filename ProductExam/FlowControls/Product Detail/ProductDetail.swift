//
//  ProductDetail.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit

typealias ProductInformation = ProductDetail.GetProductDetail.ProductInformation

struct ProductDetail {
    
    //MARK: Use Cases
    struct GetProductDetail {
        struct Request {
            
        }
        
        struct Response {
            let status: GetProductDetailStatus
            let product: ProductEntity?
        }
        
        struct ViewModel {
            let status: GetProductDetailStatus
            let productInformation: ProductInformation?
        }
        
        enum GetProductDetailStatus {
            case success
            case failure
        }
        
        struct ProductInformation {
            var id: Int
            var title: String?
            var image: URL?
            var hiddenNewTag: Bool
            var description: String?
            var price: String?
            var placeholderImage: UIImage?
        }
    }
}
