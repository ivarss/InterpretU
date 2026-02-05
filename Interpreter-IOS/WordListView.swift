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

#Preview {
    WordListView()
        .modelContainer(DataManagement.getExampleContainer())
}
