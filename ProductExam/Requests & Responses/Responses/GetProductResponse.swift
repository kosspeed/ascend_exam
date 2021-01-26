//
//  GetProductResponse.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

struct GetProductResponse: Decodable {
    var id: Int?
    var title: String?
    var image: String?
    var content: String?
    var isNewProduct: Bool?
    var price: Double?
}

//MARK: Transfrom
extension GetProductResponse {
    var entity: ProductEntity {
        var entity = ProductEntity()
        entity.id = id ?? 0
        entity.title = title
        entity.image = image
        entity.content = content
        entity.isNewProduct = isNewProduct ?? false
        entity.price = price ?? 0.0
        
        return entity
    }
}
