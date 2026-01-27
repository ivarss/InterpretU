//
//  ContentView.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-14.
//
// This is more or less just a way for us to actually load and display data from the database. More so as a debugging tool later on, Currently though it is not functional.

import SwiftUI
import SwiftData

/// The SwiftUI view to view all the data passed into swiftdata.
struct DataView: View {
    @Environment(\.modelContext) var modelContext
    @Query var mainWords: [MainWord]
    var body: some View {
        // TODO: Make a button to manually add live data from csv file.
        // TODO: Make a button to manually delete current live data.
        // TODO: Navigation to this screen from somewhere in our live project.
        // TODO: Make the UI cleaner, add Frame limits to each section so they seperate nicely.
        
        // List to display all the Main words we have and each of their translated words and the languages for it.
        List {
            ForEach(mainWords) { mainWord in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Main")
                        Text(mainWord.wordKey)
                    }
                    VStack(alignment: .center) {
                        Text("Category")
                        Text(mainWord.cat)
                    }
                    Spacer()
                        DisclosureGroup {
                            ForEach(mainWord.translation) { tranWord in
                                VStack{
                                    
                                    HStack {
                                        Text(tranWord.lang + ": ")
                                        Text(tranWord.tranText)
                                    }
                                }
                            }
                        } label: {
                            Spacer()
                            VStack(alignment: .trailing) {
                            Text("Translations: ")
                            Text(String(mainWord.translation.count))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
      do {
          let config = ModelConfiguration(isStoredInMemoryOnly: true)
          // Include all SwiftData models used by your view or populate function
          let container = try ModelContainer(for: MainWord.self, Word.self, configurations: config)

          let context = ModelContext(container)
          // This must be implemented to insert into SwiftData using the given context
          populateExamples(context: context)

          return DataView()
              .modelContainer(container)
      } catch {
          fatalError("Failed to create in-memory container: \(error)")
      }
  }

