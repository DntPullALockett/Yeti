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
                        .font(.system(size: 18, weight: .bold))
                    Text(debt.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .font(.system(size: 14))
                    ProgressView(value: debt.paidOffAmount == 0 ? 0 : debt.payoffProgress)
                        .frame(maxWidth: .infinity)
                        .frame(height: 10)

                }
                .swipeActions {
                    Button {
                        withAnimation {
                            debt.paidOffAmount += debt.minimumPaymentAmount
                            totalBalance -= debt.minimumPaymentAmount
                            debt.payoffProgress = (debt.paidOffAmount / debt.amount)
                            if debt.payoffProgress == 1 {
                                modelContext.delete(debt)
                            }
                        }
                    } label: {
                        Label("Make Minimum Payment", systemImage: "creditcard.fill")
                            .tint(.accent)
                    }
                    
                    Button(role: .destructive) {
                        withAnimation {
                            totalBalance -= debt.amount
                        }
                        modelContext.delete(debt)
                    } label: {
                        Label("Delete", systemImage: "trash.slash.fill")
                    }
                    
                    
                }
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    HomeView()
}
