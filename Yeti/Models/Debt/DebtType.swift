//
//  DebtType.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import Foundation

enum DebtType: String, Codable, CaseIterable, Identifiable {
    case creditCard = "Credit Card"
    case auto = "Auto Loan"
    case educational = "Educational Loan"
    case personal = "Personal Loan"
    case mortgage = "Mortgage"
    
    var id: Self { self }
}
