//
//  Double.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 30/12/22.
//

import Foundation

extension Double {
    private var currencyFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    private var numberFormatter : NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }
    
    func toCurrencyString() -> String {
        return currencyFormatter.string(for: self) ?? "₹0.00"
    }
    
    func toPercentageString() -> String {
        guard let numberAsString = numberFormatter.string(for: self) else { return " "}
        return numberAsString 
    }
}
