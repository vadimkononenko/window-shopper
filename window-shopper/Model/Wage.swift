//
//  Wage.swift
//  window-shopper
//
//  Created by Vadim Kononenko on 09.02.2023.
//

import Foundation

struct Wage {
    static func getHours(wage: Double, price: Double) -> Int{
        Int(ceil(price/wage))
    }
}
