//
//  InterestRatePeriodType.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import Foundation

enum InterestRatePeriodType: String, Codable, CaseIterable, Identifiable {
    case monthly
    case quarterly
    case semiannually
    case annually
    
    var id: Self { self }
}
