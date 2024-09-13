//
//  AddDebtView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI

struct AddDebtView: View {
    
    var action: ((Debt) -> Void)? = nil
    
    init(action: ((Debt) -> Void)?) {
        self.action = action
    }
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var type: DebtType = .creditCard
    @State private var amountOwed = ""
    @State private var minimumPayment = ""
    @State private var interestRate = ""
    @State private var zeroInterestRate = false
    @State private var hasPromotionalInterestRate = false
    @State private var interestEndDate = Date()
    @State private var interestRatePeriodType: InterestRatePeriodType = .monthly
    @State private var debt: Debt?
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $name)
                        Picker("Type", selection: $type) {
                            ForEach(DebtType.allCases) { debtType in
                                Text(debtType.rawValue)
                            }
                        }
                    }
                    
                    Section {
                        TextField("Amount Owed", text: $amountOwed)
                            .keyboardType(.decimalPad)
                        TextField("Minimum Payment", text: $minimumPayment)
                            .keyboardType(.decimalPad)
                    }
                    
                    Section {
                        Toggle("Zero Interest Rate", isOn: $zeroInterestRate)
                            .disabled(hasPromotionalInterestRate)
                            .tint(.accent)
                        Toggle("Promotional Interest Rate", isOn: $hasPromotionalInterestRate)
                            .disabled(zeroInterestRate)
                            .tint(.accent)
                        
                        if zeroInterestRate || hasPromotionalInterestRate {
                            DatePicker("End Date", selection: $interestEndDate)
                        }
                    }
                    
                    Section {
                        if !zeroInterestRate {
                            TextField("Interest Rate", text: $interestRate)
                                .keyboardType(.decimalPad)
                                .disabled(zeroInterestRate)
                            Picker("Interest Period", selection: $interestRatePeriodType) {
                                ForEach(InterestRatePeriodType.allCases) { type in
                                    Text(type.rawValue.capitalized)
                                }
                            }
                        }
                    }
                }
                
                Button {
                    debt = createDebt()
                    guard let debt else { return }
                    modelContext.insert(debt)
                    action?(debt)
                    dismiss()
                } label: {
                    Text("Add")
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .padding(.horizontal, 20)
                        .background(.accent)
                        .foregroundStyle(.black)
                        .font(.system(size: 18, weight: .bold))
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Add debt")
                        .font(.system(size: 28, weight: .bold))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.accent)
                            .font(.system(size: 18, weight: .bold))
                    }
                    
                }
            }
        }
    }
    
    private func createDebt() -> Debt {
        return Debt(
            type: type,
            name: name,
            amount: Double(amountOwed) ?? 0.0,
            minimumPaymentAmount: Double(minimumPayment) ?? 0.0,
            interestRate: Double(interestRate) ?? 0.0,
            interestRatePeriod: .init(end: interestEndDate),
            interestRatePeriodType: interestRatePeriodType
        )
    }
}

#Preview {
    AddDebtView(action: nil)
}
