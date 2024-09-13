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
    var id: UUID = UUID()
    var type: DebtType
    var name: String
    var amount: Double
    var minimumPaymentAmount: Double
    var paidOffAmount: Double
    var payoffProgress: Double
    var interestRate: Double
    var interestRatePeriod: InterestRatePeriod
    var interestRatePeriodType: InterestRatePeriodType
    
    init(type: DebtType, name: String, amount: Double, minimumPaymentAmount: Double, paidOffAmount: Double, payoffProgress: Double, interestRate: Double, interestRatePeriod: InterestRatePeriod, interestRatePeriodType: InterestRatePeriodType) {
        self.type = type
        self.name = name
        self.amount = amount
        self.minimumPaymentAmount = minimumPaymentAmount
        self.paidOffAmount = paidOffAmount
        self.payoffProgress = payoffProgress
        self.interestRate = interestRate
        self.interestRatePeriod = interestRatePeriod
        self.interestRatePeriodType = interestRatePeriodType
    }
}
