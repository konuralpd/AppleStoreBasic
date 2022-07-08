//
//  CurrencyFormatter.swift
//  AppleStoreWonder
//
//  Created by Mac on 8.07.2022.
//

import Foundation


enum CurrencyFormatter {
    static let turkisgLiraFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }()
}

extension NumberFormatter {
    func string(from float: Float) -> String? {
        return self.string(from: NSNumber(value: float))
    }
    
    func string(from int: Int) -> String? {
        return self.string(from: NSNumber(value: int))
    }
}
