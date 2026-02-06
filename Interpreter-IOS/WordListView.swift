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
    @Query var mainWords: [MainWord]

    @State private var searchText = ""

    // Filtrerad lista baserat på söktext
    var filteredWords: [MainWord] {
        mainWords.filter { word in

            // 1. rätt kategori
            guard word.cat == category else { return false }

            // 2. måste ha båda språken
            let hasSource = word.translation.contains {
                $0.lang == sourceLanguage
            }

            let hasTarget = word.translation.contains {
                $0.lang == targetLanguage
            }

            guard hasSource && hasTarget else { return false }

            // 3. sök
            if searchText.isEmpty { return true }

            return
                word.wordKey.localizedCaseInsensitiveContains(searchText) ||
                word.translation.contains {
                    $0.tranText.localizedCaseInsensitiveContains(searchText)
                }
        }
    }
    
    
    

    var body: some View {
        
        Text("Ordlistan")
            List {
                ForEach(filteredWords) { word in
                    WordRowView(
                        mainWord: word,
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage
                    )
                    
                }
            }

            
          
        .searchable(text: $searchText,
                    placement: .automatic,
                    prompt: "Sök ord eller översättning")
    }
    
}


#Preview {
    WordListView(
        category: "MIGRATION",
        sourceLanguage: "Svenska",
        targetLanguage: "English"
    )
    .modelContainer(DataManagement.getExampleContainer())
}

