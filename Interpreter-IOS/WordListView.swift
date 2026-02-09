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

    let category: String
    let sourceLanguage: String
    let targetLanguage: String

    // Use a dynamically initialized query so we can capture `category`
    @Query private var filteredWords: [MainWord]
    init(category: String, sourceLanguage: String, targetLanguage: String) {
        self.category = category
        self.sourceLanguage = sourceLanguage
        self.targetLanguage = targetLanguage
        // Initialize the query with a predicate that uses the provided category
        self._filteredWords = Query(filter: #Predicate<MainWord> { word in
            word.cat.localizedStandardContains(category)
        })
    }

    

    // Filtrerad lista baserat på kategori och språk

    var body: some View {
        Text(category)
        List {
            ForEach(filteredWords) { mainWord in
                WordRowView(
                    mainWord: mainWord,
                    sourceLanguage: sourceLanguage,
                    targetLanguage: targetLanguage
                )
            }
        }
    }
}


#Preview {
    WordListView(
        category: "Migration",
        sourceLanguage: "SV",
        targetLanguage: "ES"
    )
    .modelContainer(DataManagement.getExampleContainer())
}

