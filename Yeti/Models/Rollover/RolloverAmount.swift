//
//  RolloverAmount.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import Foundation
import SwiftData

@Model
final class Rollover: Identifiable {
    var id: UUID = UUID()
    var amount: Double
    
    init(amount: Double) {
        self.amount = amount
    }
}
