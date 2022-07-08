//
//  Product.swift
//  AppleStoreWonder
//
//  Created by Mac on 8.07.2022.
//

import Foundation


struct Product {
    var name: String
    var icon: String
    var price: Float
    
}

extension Product: Hashable {
    var hashValue: Int {
        return name.hashValue
    }
    
}

