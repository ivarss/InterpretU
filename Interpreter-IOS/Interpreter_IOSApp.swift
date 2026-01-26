//
//  Interpreter_IOSApp.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-14.
//

import SwiftUI
import SwiftData

@main
struct Interpreter_IOSApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Word.self, MainWord.self
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
            FirstView()
        }
        .modelContainer(sharedModelContainer)
    }
}
