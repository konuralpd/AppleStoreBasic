//
//  ViewController.swift
//  AppleStoreWonder
//
//  Created by Mac on 8.07.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private lazy var appleCartButton: CartBadge = {
        let button = CartBadge(image: UIImage(named: "cart")!, badgeText: nil, target: self, action: #selector(cartButtonPressed))
        
       
        
        
        return button
    }()
    
    private lazy var products: [Product] = {
       let macbookair = Product(name: "Macbook Air", icon: "macbookair", price: 14999)
       let macbookpro = Product(name: "Macbook Pro", icon: "macbookpro", price: 25999)
       let airpods = Product(name: "AirPods", icon: "airpods", price: 3999)
       let ipad = Product(name: "iPad", icon: "ipad", price: 8999)
       let imac = Product(name: "iMac", icon: "imac", price: 45999)
        
        return [macbookair, macbookpro, airpods, ipad, imac]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = appleCartButton
        configureTableView()
    }
    
    @objc func cartButtonPressed() {
        
        
    }
    
    private func configureTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: CGFloat.leastNonzeroMagnitude))
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCell {
            cell.configure(with: products[indexPath.row])
            return cell
        }
    
        return UITableViewCell()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let product = sender as? Product else { return }
        
        if segue.identifier == "OrderCartSegue" {
            if let viewController = segue.destination as? CartViewController {
                viewController.product = product
                viewController.title = product.name
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard indexPath.row < products.count else { return }
        
        performSegue(withIdentifier: "OrderCartSegue", sender: products[indexPath.row])
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let totalOrderCount = ShopCart.shared.getTotalCount()
        
        appleCartButton.badgeText = totalOrderCount != 0 ? "\(totalOrderCount)" : nil
    }
}
