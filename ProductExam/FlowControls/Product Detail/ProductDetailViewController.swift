//
//  ProductDetailViewController.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit
import Kingfisher
import ProgressHUD

class ProductDetailViewController: UIViewController {
    //MARK: @IBOutlet
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var newTagLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var emptyView: UIView!
    
    //MARK: VIP Cycle
    var interactor: ProductDetailBusinessLogic!
    var router: (ProductDetailRoutable & ProductDetailDataPassing)!
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getProductDetail()
    }
}

//MARK: Setup & Configuration
extension ProductDetailViewController {
    private func configure() {
        let viewController = self
        let router = ProductDetailRouter(viewController: viewController)
        let presenter = ProductDetailPresenter(displayable: viewController)
        let interactor = ProductDetailInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        viewController.router = router
        viewController.router.dataStore = interactor
    }
    
    private func setup() {
        
    }
}

//MARK: Logics
private extension ProductDetailViewController {
    func getProductDetail() {
        interactor.getProductDetail(request: .init())
        
        ProgressHUD.show("Loading...")
    }
}

//MARK: Displayable
extension ProductDetailViewController: ProductDetailDisplayable {
    func displayGetProductDetail(viewModel: ProductDetail.GetProductDetail.ViewModel) {
        emptyView.isHidden = viewModel.status == .success
        
        switch viewModel.status {
        case .success:
            guard let information = viewModel.productInformation else {
                emptyView.isHidden = false
                
                return
            }
            
            productNameLabel.text = information.title
            productPriceLabel.text = information.price
            productDescriptionLabel.text = information.description
            newTagLabel.isHidden = information.hiddenNewTag
            
            productImageView.kf.setImage(with: information.image,
                                         placeholder: information.placeholderImage)
        case .failure:
            AlertHelper.alert(title: "Error",
                              message: "Somethig went wrong!",
                              viewController: self)
        }
        
        ProgressHUD.dismiss()
    }
}

//MARK: Make
extension ProductDetailViewController {
    static func make() -> ProductDetailViewController? {
        let storyboard = UIStoryboard(name: "ProductDetail", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController else {
            return nil
        }
        
        return viewController
    }
}

