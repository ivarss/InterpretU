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
    
    @State private var searchText: String = ""

    private var searchResults: [MainWord] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        // If empty, return all words in this category (the default list already does this via @Query)
        guard !trimmed.isEmpty else { return filteredWords }
        do {
            let predicate = #Predicate<MainWord> { main in
                // Must be within the selected category
                main.cat.localizedStandardContains(category) && (
                    // Match main word key
                    main.wordKey.localizedStandardContains(trimmed)
                ||
                    // Or any translation in selected source/target languages matches
                    main.translation.contains { t in
                        (t.lang == sourceLanguage || t.lang == targetLanguage) &&
                        t.tranText.localizedStandardContains(trimmed)
                    }
                )
            }
            let descriptor = FetchDescriptor<MainWord>(predicate: predicate)
            return try modelContext.fetch(descriptor)
        } catch {
            print("Search fetch failed: \(error)")
            return []
        }
    }

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
        
        // Sökfält
        HStack {
            Image(systemName: "line.3.horizontal.decrease")
            
            TextField("Search word...", text: $searchText)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled(true)
                .multilineTextAlignment(.center)
            
            Image(systemName: "magnifyingglass")
            
        }
        .padding(20)
        .background(Color.green.opacity(0.2))
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(.horizontal)
        List {
            ForEach(searchResults) { mainWord in
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

