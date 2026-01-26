//
//  ExampleData.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-20.
//

import Foundation
import Playgrounds
import SwiftData

func populateExamples() {
    
    if let ExWords = Bundle.main.path(forResource: "ExampleWords", ofType: "csv") {
        do {
            let contents = try String(contentsOfFile: ExWords)
            let rows = contents.split(separator: "\r\n")
            
            var columns = [String]()
            for (index,row) in rows.enumerated() {
                let words = row.split(separator: ",")
                
                if index == 0 {
                    columns = words as! [String]
                    continue
                }
                
                var main = MainWord(wordKey: String(words[0]), cat: String(words[1]), translation: [])
                var tWords = [Word]()
                for colIndex in 2..<words.count {
                    let tw = Word(mWord: main, lang: columns[colIndex], tranText: words[colIndex] as! String)
                    tWords.append(tw)
                }
                main.translation = tWords
                //print("LANG " + lang + " MAIN: " + words[0] + " T: " + words[1])
            }
            
        } catch {
            // contents could not be loaded
        }
    } else {
        // example.txt not found!
    }
}

#Playground {
    populateExamples()
}
