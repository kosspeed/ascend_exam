//
//  GetProductDetailUseCase.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import Foundation

protocol GetProductDetailUseCase {
    func execute(id: Int, completion: @escaping ((ProductEntity) -> Void), failure: @escaping ((Error) -> Void))
}

class GetProductDetailUseCaseImpl: GetProductDetailUseCase {
    let repository: ProductRepository
    
    init(repository: ProductRepository = ProductRepositoryImpl()) {
        self.repository = repository
    }
    
    func execute(id: Int, completion: @escaping ((ProductEntity) -> Void), failure: @escaping ((Error) -> Void)) {
        let request = GetProductDetailRequest(id: id)
        repository.getProductDetail(request: request,
                                    completion: completion,
                                    failure: failure)
    }
}
