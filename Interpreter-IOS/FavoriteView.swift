//
//  FavoriteView.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-01-31.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    let sourceLanguage: String
    let targetLanguage: String
    
    @Query var favoriteWords: [MainWord]

    init(sourceLanguage: String, targetLanguage: String) {
        self.sourceLanguage = sourceLanguage
        self.targetLanguage = targetLanguage

        _favoriteWords = Query(
            filter: #Predicate<MainWord> { $0.isFavorite }
        )
    }


    var body: some View {
        NavigationStack {
            List {
                ForEach(favoriteWords) { mainWord in
                    WordRowView(
                        mainWord: mainWord,
                        sourceLanguage: sourceLanguage,
                        targetLanguage: targetLanguage
                    )
                }

                }
            }
            .navigationTitle("Favoriter")
            .searchable(text: .constant(""))  // kan lägga till sök här också
        }
    }




#Preview {
    FavoriteView(
        sourceLanguage: "Svenska",
        targetLanguage: "Engelska"
    )
    .modelContainer(DataManagement.getExampleContainer())
}

