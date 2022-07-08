//
//  ProductCell.swift
//  AppleStoreWonder
//
//  Created by Mac on 8.07.2022.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    
    func configure(with product: Product) {
        productImageView.image = UIImage(named: product.icon)
        productImageView.clipsToBounds = true
        productNameLabel.text = product.name
        productNameLabel.numberOfLines = 2
    }

}
