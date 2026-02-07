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

    // Filtrerad lista baserat på kategori och språk
    var filteredWords: [MainWord] {
        mainWords.filter { word in
            // Normalize inputs for robust comparison
            let normalizedCategory = category.trimmingCharacters(in: .whitespacesAndNewlines)
            let wordCategory = word.cat.trimmingCharacters(in: .whitespacesAndNewlines)

            // 1. rätt kategori (skiftlägesokänslig)
            guard wordCategory.caseInsensitiveCompare(normalizedCategory) == .orderedSame else { return false }

            // 2. måste ha båda språken (normalisera till versaler)
            let src = sourceLanguage.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
            let tgt = targetLanguage.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

            let hasSource = word.translation.contains { $0.lang.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() == src }
            let hasTarget = word.translation.contains { $0.lang.trimmingCharacters(in: .whitespacesAndNewlines).uppercased() == tgt }

            return hasSource && hasTarget
        }
    }

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
        targetLanguage: "EN"
    )
    .modelContainer(DataManagement.getExampleContainer())
}
