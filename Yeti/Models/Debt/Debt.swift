//
//  Debt.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import Foundation
import SwiftData

@Model
final class Debt: Identifiable {
    var id: Int
    var type: DebtType
    var name: String
    var amount: Double
    var interestRate: Double
    var interestRatePeriod: InterestRatePeriod
    var interestRatePeriodType: InterestRatePeriodType
    
    init(id: Int, type: DebtType, name: String, amount: Double, interestRate: Double, interestRatePeriod: InterestRatePeriod, interestRatePeriodType: InterestRatePeriodType) {
        self.id = id
        self.type = type
        self.name = name
        self.amount = amount
        self.interestRate = interestRate
        self.interestRatePeriod = interestRatePeriod
        self.interestRatePeriodType = interestRatePeriodType
    }
}
