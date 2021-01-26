//
//  ProductAPI.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation
import Moya

enum ProductAPI: TargetType {
    case getProducts
    case getProductDetail(request: GetProductDetailRequest)
}

//MARK: TargetType
extension ProductAPI {
    var baseURL: URL {
        return URL(string: "https://ecommerce-product-app.herokuapp.com/")!
    }
    
    var path: String {
        switch self {
        case .getProducts: return "products"
        case .getProductDetail(let request): return "products/\(request.id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getProducts: return .get
        case .getProductDetail: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .getProducts: return .requestPlain
        case .getProductDetail: return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

