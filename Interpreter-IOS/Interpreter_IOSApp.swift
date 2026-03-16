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
    let sharedModelContainer: ModelContainer
    
    init() {
        let schema = Schema([
            Word.self, MainWord.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
        
        do {
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            sharedModelContainer = container
            
            Task { @MainActor in
                let seedVersion = "v1.0" // Bump this when LiveWords.csv changes
                let seedKey = "seededDataVersion"
                
                guard UserDefaults.standard.string(forKey: seedKey) != seedVersion else { return }
                
                DataManagement().populateData(context: container.mainContext)
                UserDefaults.standard.set(seedVersion, forKey: seedKey)
            }
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            FirstView()
        }
        .modelContainer(sharedModelContainer)
    }
}
