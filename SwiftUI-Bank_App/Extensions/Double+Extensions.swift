//
//  Double+Extensions.swift
//  SwiftUI-Bank_App
//
//  Created by Fadli M on 01/05/23.
//

import Foundation

extension Double {
    
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        let formattedCurrency = formatter.string(from: self as NSNumber)
        return formattedCurrency ?? ""
    }
}
