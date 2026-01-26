//
//  ContentView.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-14.
//
// This is more or less just a way for us to actually load and display data from the database. More so as a debugging tool later on, Currently though it is not functional.

import SwiftUI
import SwiftData

struct DataView: View {
    @Environment(\.modelContext) var modelContext
    @Query var mainWords: [MainWord]
    var body: some View {
        // TODO: Make a button to manually add live data from csv file.
        // TODO: Make a button to manually delete current live data.
        
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
    /*
    @Environment(\.modelContext) var modelContext
    @Query var words: [Word]

    var body: some View {
        NavigationStack{
            List {
                ForEach(words) {word in
                    VStack (alignment: .leading) {
                        Text(word.key)
                            .font(.headline)
                        Text(word.textSV)
                        Text(word.textES)
                    }
                }
//                onDelete(perform: deleteWord())
            }
            .navigationTitle("Basic")
            .toolbar {
                Button("Add Samples", action: addSampleWords)
            }
        }
    }
}
*/
/*

 */



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
    /*do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Word.self, configurations: config)
        let mainExample = try MainWord(wordKey: "hello", cat: "test")
        let exampleWords = try Word(mWord: "hello", lang: "ES", tranWord: "Hola")
        return DataView(words: exampleWord)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create container")
    }*/

