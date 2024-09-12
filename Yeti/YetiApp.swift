//
//  YetiApp.swift
//  Yeti
//
//  Created by Anthony Lockett on 9/12/24.
//

import SwiftUI
import SwiftData

@main
struct YetiApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Debt.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(sharedModelContainer)
    }
}
