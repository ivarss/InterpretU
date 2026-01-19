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
    var wordKey : String = ""
    var cat: String = ""
    @Relationship(deleteRule: .cascade) var translations = [Word]()
    
    init(wordKey: String, cat: String, translations: Word) {
        self.wordKey = wordKey
        self.cat = cat
    }
}


@Model
final class Word {
    var mWord: MainWord
    var lang : String = ""
    var wordText : String = ""
    
    init(mWord: MainWord, lang: String, wordtext: String) {
        self.mWord = mWord
        self.lang = lang
        self.wordText = wordText
    }
}
