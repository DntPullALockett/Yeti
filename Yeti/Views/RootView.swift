//
//  ContentView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI
import SwiftData

struct RootView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var debts: [Debt]
    @State private var showAddDebtView = false

    var body: some View {
        NavigationView {
            TabView {
                Tab("Overview", systemImage: "house.fill") {
                    HomeView()
                }
                
                Tab("Monthly", systemImage: "calendar") {
                    MonthlyView()
                }
                
                Tab("Budget", systemImage: "chart.pie.fill") {
                    BudgetView()
                }
                
                Tab("Settings", systemImage: "ellipsis") {
                    SettingsView()
                }
            }
            .overlay(alignment: .bottom) {
//                Color.black
//                    .frame(height: 100)
//                    .edgesIgnoringSafeArea(.bottom)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Yeti")
                        .font(.system(size: 32 , weight: .bold))
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddDebtView.toggle()
                    } label: {
                        if showAddDebtView {
                            withAnimation {
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.black)
                            }
                        } else {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("Add debt")
                            }
                            .foregroundStyle(.black)
                        }
                    }

                }
            }
            .sheet(isPresented: $showAddDebtView, content: {
                AddDebtView()
            })
        }
    }

    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
    }

    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
    }
}

#Preview {
    RootView()
        .modelContainer(for: Debt.self, inMemory: true)
}
