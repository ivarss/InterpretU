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
                    Text(word.mword.wordKey)
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
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Word.self, MainWord.self, configurations: config)
    let example = try Word(id: "example", text: "Example")
    ContentView()
}
