//
//  GetProductDetailRequest.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

struct GetProductDetailRequest: Encodable {
    let id: Int
    
    init(id: Int) {
        self.id = id
    }
}
