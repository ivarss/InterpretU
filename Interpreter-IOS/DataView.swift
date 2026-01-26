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
    @Query var words: [Word]
    var body: some View {
        List {
            ForEach(words) { word in
                VStack {
                    Text(word.mWord.wordKey)
                    Text(word.tranText)
                    //Text()
                    //Text()
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
    DataView()
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
}
