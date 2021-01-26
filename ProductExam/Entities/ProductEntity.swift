//
//  ProductEntity.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

struct ProductEntity {
    var id: Int
    var title: String?
    var image: String?
    var content: String?
    var isNewProduct: Bool
    var price: Double
    
    init() {
        id = 0
        isNewProduct = false
        price = 0.0
    }
}
