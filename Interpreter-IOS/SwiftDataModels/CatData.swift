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
    var name: String
    var icon: String
    
    init ( name: String, icon: String) {
        self.name = name
        self.icon = icon
    }
}
