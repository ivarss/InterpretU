//
//  cat.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-19.
//

import Foundation
import SwiftData

@Model
class Cat {
    var id: UUID
    var name: String
    
    init (id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}

@Model
class CatWords {
    var catID = [Cat]()
    var mainWordID = [Main]()
}
