//
//  CartViewController.swift
//  AppleStoreWonder
//
//  Created by Mac on 8.07.2022.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var orderCountLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var addToCartButton: UIButton!
    
    var product: Product!
    var totalOrder: Int = 0 {
        didSet {
            if viewIfLoaded != nil {
                orderCountLabel.text = "\(totalOrder)"
                totalPriceLabel.text = CurrencyFormatter.turkisgLiraFormatter.string(from: Float(totalOrder) * product.price)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        populateUI()
       
    }
    
    private func populateUI() {
        guard let product = product else { return }
        
        productNameLabel.text = product.name
        productImageView.image = UIImage(named: product.icon)
        productPriceLabel.text = CurrencyFormatter.turkisgLiraFormatter.string(from: product.price)
        totalOrder = 0
        
    }
    
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        totalOrder += 1
    }
    
    
    @IBAction func removeButtonClicked(_ sender: UIButton) {
        guard totalOrder > 0 else { return }
        
        totalOrder -= 1
    }
    
    @IBAction func addToCartButtonClicked(_ sender: UIButton) {
        
        guard let product = product else { return
            }
        
        ShopCart.shared.addProduct(product, withCount: totalOrder)
        
        navigationController?.popViewController(animated: true)
        
    }
    
  
}
