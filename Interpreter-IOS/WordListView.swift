//
//  WordListView.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-01-31.
//

import SwiftUI
import SwiftData


struct WordListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var mainWords: [MainWord]

    @State private var searchText = ""

    // Filtrerad lista baserat på söktext
    var filteredWords: [MainWord] {
        if searchText.isEmpty {
            return mainWords
        } else {
            return mainWords.filter { mainWord in
                // sök i huvudordet OCH i alla översättningar
                let matchKey = mainWord.wordKey
                    .localizedCaseInsensitiveContains(searchText)

                let matchTranslations = mainWord.translation.contains { tran in
                    tran.tranText.localizedCaseInsensitiveContains(searchText)
                }

                return matchKey || matchTranslations
            }
        }
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(filteredWords) { mainWord in
                    WordRowView(mainWord: mainWord) 
                }
                
        
                
                

            }
            .navigationTitle("Ord Lista")
        }
        .searchable(text: $searchText,
                    placement: .automatic,
                    prompt: "Sök ord eller översättning")
    }
    
}

@MainActor
let previewContainer: ModelContainer = {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: MainWord.self, Word.self,
                                        configurations: config)

    let context = container.mainContext

    let heart = MainWord(wordKey: "heart", cat: "Medical")
    let hjärta   = Word(mWord: heart, lang: "sv", tranText: "hjärta")
    heart.translation = [hjärta]
    context.insert(heart)
    
    let brain = MainWord(wordKey: "brain", cat: "Medical")
    let hjärna   = Word(mWord: brain, lang: "sv", tranText: "hjärna")
    brain.translation = [hjärna]
    context.insert(brain)
    
    let kidney = MainWord(wordKey: "kidney", cat: "Medical")
    let njure   = Word(mWord: kidney, lang: "sv", tranText: "njure")
    kidney.translation = [njure]
    context.insert(kidney)

    return container
}()

#Preview {
    WordListView()
        .modelContainer(previewContainer)
}
