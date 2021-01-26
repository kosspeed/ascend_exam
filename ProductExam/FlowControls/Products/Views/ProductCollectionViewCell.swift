//
//  ProductCollectionViewCell.swift
//  ProductExam
//
//  Created by k.siricharoenporn on 26/1/2564 BE.
//  Copyright © 2564 Khwan Siricharoenporn. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    //MARK: IBOulet
    @IBOutlet weak var newTagLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    //MARK: Static Properties
    static let nib: UINib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    static let identifier: String = "ProductCollectionViewCellIdentifier"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
}

//MARK: Setup
private extension ProductCollectionViewCell {
    func setup() {
        containerView.layer.cornerRadius = 10
    }
}

//MARK: Configure
extension ProductCollectionViewCell {
    func configure(product: ProductCell) {
        newTagLabel.isHidden = product.hiddenNewTag
        productNameLabel.text = product.title
        priceLabel.text = product.price
        
        productImageView.kf.setImage(with: product.image,
                                     placeholder: product.placeholderImage)
    }
}
