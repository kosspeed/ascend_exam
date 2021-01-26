//
//  GetProductUseCase.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

protocol GetProductUseCase {
    func execute(completion: @escaping (([ProductEntity]) -> Void), failure: @escaping ((Error) -> Void))
}

class GetProductUseCaseImpl: GetProductUseCase {
    let repository: ProductRepository
    
    init(repository: ProductRepository = ProductRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (([ProductEntity]) -> Void), failure: @escaping ((Error) -> Void)) {
        repository.getProducts(completion: completion, failure: failure)
    }
}
