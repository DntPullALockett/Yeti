//
//  HomeView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                BalanceView("Debt Balance", amount: 42343)
                    .foregroundStyle(.red)
                Spacer()
                BalanceView("Current Rollover", amount: 350)
                    .padding(.trailing, 16)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .padding(.top, 20)
        Divider()
        Spacer()
    }
}

#Preview {
    HomeView()
}
