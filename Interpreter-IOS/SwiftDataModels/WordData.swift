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
    var cat: String?
    @Relationship(deleteRule: .cascade) var translation = [Word]()
    
    init(wordKey: String, cat: String? = nil, translation: [Word] = []) {
        self.wordKey = wordKey
        self.cat = cat
        self.translation = translation
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
