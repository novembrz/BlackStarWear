//
//  Double.swift
//  BlackStarWear
//
//  Created by Дарья on 12.10.2020.
//

import Foundation

extension Double {
    func rounded(digits: Int) -> Double {
        let multiplier = pow(10.0, Double(digits))
        return (self * multiplier).rounded() / multiplier
    }
}
