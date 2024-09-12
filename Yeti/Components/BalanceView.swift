//
//  BalanceView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI

struct BalanceView: View {
    
    private var title: LocalizedStringKey
    private var amount: Double
    
    init(_ title: LocalizedStringKey, amount: Double) {
        self.title = title
        self.amount = amount
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 12))
                .foregroundStyle(.gray)
            Text(amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .font(.system(size: 24, weight: .bold))
        }
    }
}
