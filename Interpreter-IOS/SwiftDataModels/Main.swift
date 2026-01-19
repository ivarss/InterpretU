//
//  Item.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-14.
//

import Foundation
import SwiftData

@Model
class Main {
    var id: UUID
    var key: String
    
    init(id: UUID, key: String = "") {
        self.id = id
        self.key = key
    }
}
