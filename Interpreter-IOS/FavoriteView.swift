//
//  FavoriteView.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-01-31.
//

import SwiftUI
import SwiftData

struct FavoriteView: View {
    @Query(sort: \MainWord.wordKey) var favoriteWords: [MainWord]
    // Filtera automatiskt med predicate i @Query
    init() {
        _favoriteWords = Query(filter: #Predicate<MainWord> { $0.isFavorite })
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(favoriteWords) { mainWord in
                    WordRowView(mainWord: mainWord)
                }
            }
            .navigationTitle("Favoriter")
            .searchable(text: .constant(""))  // kan lägga till sök här också
        }
    }
}



#Preview {
    FavoriteView()
}
