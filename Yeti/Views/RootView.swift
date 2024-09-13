//
//  ContentView.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI

struct RootView: View {

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
                
                Tab("Trophies", systemImage: "trophy.fill") {
                    BudgetView()
                }
                
                Tab("More", systemImage: "ellipsis") {
                    SettingsView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Yeti")
                        .font(.system(size: 28 , weight: .bold))
                }
            }
        }
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
