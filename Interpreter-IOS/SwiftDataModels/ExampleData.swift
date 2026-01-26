//
//  ExampleData.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-20.
//

import Foundation
import Playgrounds


func dostuff() {
    if let ExSv = Bundle.main.path(forResource: "Examples-SV", ofType: "csv") {
        do {
            let contents = try String(contentsOfFile: ExSv)
            let rows = contents.split(separator: "\r\n")
            
            var lang = ""
            for (index,row) in rows.enumerated() {
                let words = row.split(separator: ",")
                if index == 0 {
                    lang = String(words[1])
                    continue
                }
                print("LANG " + lang + " MAIN: " + words[0] + " T: " + words[1])
            }
            
        } catch {
            // contents could not be loaded
        }
    } else {
        // example.txt not found!
    }}

#Playground {
    dostuff()
}
