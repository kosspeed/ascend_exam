//
//  ProductViewController.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright (c) 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit
import ProgressHUD

class ProductViewController: UIViewController {
    //MARK: @IBOutlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIView!
    
    //MARK: VIP Cycle
    var interactor: ProductBusinessLogic!
    var router: (ProductRoutable & ProductDataPassing)!
    
    //MARK: Properties
    var productCells: [ProductCell]?
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        getProducts()
    }
}

//MARK: Setup & Configuration
extension ProductViewController {
    private func configure() {
        let viewController = self
        let router = ProductRouter(viewController: viewController)
        let presenter = ProductPresenter(displayable: viewController)
        let interactor = ProductInteractor(presenter: presenter)
        
        viewController.interactor = interactor
        viewController.router = router
        viewController.router.dataStore = interactor
    }
    
    private func setup() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(ProductCollectionViewCell.nib,
                                forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
}

//MARK: UICollectionViewDelegate & UICollectionViewDataSource
extension ProductViewController: UICollectionViewDelegate & UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productCells?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        guard let product = productCells?[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        cell.configure(product: product)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = productCells?[indexPath.row] else {
            return
        }
        
        routeToProductDetail(id: product.id)
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
        
        return CGSize(width:widthPerItem, height: 255)
    }
}

//MARK: Logics
extension ProductViewController {
    func getProducts() {
        interactor.getProducts(request: .init())
        
        ProgressHUD.show("Loading...")
    }
    
    func routeToProductDetail(id: Int) {
        router.routeToProductDetail(id: id)
    }
}

//MARK: Displayable
extension ProductViewController: ProductDisplayable {
    func displayGetProducts(viewModel: Product.GetProduct.ViewModel) {
        emptyView.isHidden = viewModel.status == .success
        
        switch viewModel.status {
        case .success:
            productCells = viewModel.productCells
            collectionView.reloadData()
        case .failure:
            AlertHelper.alert(title: "Error",
                              message: "Somethig went wrong!",
                              viewController: self)
        default:
            break
        }
        
        ProgressHUD.dismiss()
    }
}

//MARK: Make
extension ProductViewController {
    static func make() -> ProductViewController? {
        let storyboard = UIStoryboard(name: "Product", bundle: nil)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController else {
            return nil
        }
        
        return viewController
    }
}

