//
//  HomeView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftData
import SwiftUI

struct HomeView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var debts: [Debt]
    @Query private var rollover: [Rollover]

    @State private var showAddDebtView = false
    @State private var totalBalance: Double = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                BalanceView("Debt Balance", amount: totalBalance)
                    .foregroundStyle(.red)
                Spacer()
                BalanceView("Monthly Rollover", amount: rollover.first?.amount ?? 0.0)
                    .padding(.trailing, 16)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 20)
        .padding(.top, 20)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showAddDebtView.toggle()
                } label: {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add debt")
                    }
                }
            }
        }
        .onAppear {
            totalBalance = 0
            debts.forEach { debt in
                totalBalance += debt.amount
            }
        }
        .fullScreenCover(isPresented: $showAddDebtView, content: {
            AddDebtView { debt in
                totalBalance += debt.amount
            }
        })
        List {
            ForEach(debts) { debt in
                VStack(alignment: .leading) {
                    Text(debt.name)
                    Text(debt.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .onDelete { indexSet in
                if let firstIndex = indexSet.first {
                    let debt = debts[firstIndex]
                    withAnimation {
                        totalBalance -= debt.amount
                    }
                    modelContext.delete(debts[firstIndex])
                    
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeView()
}
