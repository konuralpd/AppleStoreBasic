//
//  ShopCart.swift
//  AppleStoreWonder
//
//  Created by Mac on 8.07.2022.
//

import Foundation

class ShopCart {
    static let shared = ShopCart()
    
    var products: [Product: Int] = [:]
    
    private init() {}
    
    func addProduct(_ product: Product, withCount count: Int) {
        if let currentCount = products[product] {
            products[product] = currentCount + count
        } else {
            products[product] = count
        }
    }
    
    func removeProduct(_ product: Product) {
        products[product] = nil
    }
    
    func getTotalCost() -> Float {
        return products.reduce(Float(0)){ $0 + ($1.key.price * Float($1.value))}
    }
    
    func getTotalCount() -> Int {
        return products.reduce(0)  { $0 + $1.value }
    }
    
 
    
}
