//
//  Word.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-19.
//

import Foundation
import SwiftData

@Model
class Word {
    var lang: String
    var text: String
    var main = [Main]()
    
    init(lang: String, text: String) {
        self.lang = lang
        self.text = text
    }
}
