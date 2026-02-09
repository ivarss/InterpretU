//
//  Word.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-19.
//

import Foundation
import SwiftData

@Model
final class MainWord {
    var wordKey : String
    var cat: String
    var isFavorite: Bool
    @Relationship(deleteRule: .cascade) var translation = [Word]()
    
    init(wordKey: String, cat: String, translation: [Word] = [], isFav: Bool = false) {
        self.wordKey = wordKey
        self.cat = cat
        self.translation = translation
        self.isFavorite = isFav
    }
}


@Model
final class Word {
    var mWord: MainWord
    var lang : String
    var tranText : String
    
    init(mWord: MainWord, lang: String, tranText: String) {
        self.mWord = mWord
        self.lang = lang
        self.tranText = tranText
    }
}
/* Data Model for categories if we decide that we want to utilize it as a object rather than the current choice which is a simple string
@Model
class Category {
    var name: String
    var icon: String
    
    @Relationship(deleteRule: .cascade) var mainwords = [MainWord]()
    
    init ( name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}
 */
