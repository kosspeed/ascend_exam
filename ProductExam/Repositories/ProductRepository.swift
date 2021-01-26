//
//  ProductRepository.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation
import Moya

protocol ProductRepository {
    func getProducts(completion: @escaping (([ProductEntity]) -> Void), failure: @escaping ((Error) -> Void))
    func getProductDetail(request: GetProductDetailRequest, completion: @escaping ((ProductEntity) -> Void), failure: @escaping ((Error) -> Void))
}

class ProductRepositoryImpl: ProductRepository {
    let provider: MoyaProvider<ProductAPI>
    
    init() {
        provider = MoyaProvider<ProductAPI>()
    }
    
    func getProducts(completion: @escaping (([ProductEntity]) -> Void), failure: @escaping ((Error) -> Void)) {
        provider.request(.getProducts) { (result) in
            switch result {
            case .success(let response):
                do {
                    let products = try JSONDecoder().decode([GetProductResponse].self, from: response.data)
                    completion( products.map { $0.entity} )
                } catch (let error) {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getProductDetail(request: GetProductDetailRequest, completion: @escaping ((ProductEntity) -> Void), failure: @escaping ((Error) -> Void)) {
        provider.request(.getProductDetail(request: request)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let product = try JSONDecoder().decode(GetProductResponse.self, from: response.data)
                    completion(product.entity)
                } catch (let error) {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
}
