//
//  ExampleData.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-20.
//

import Foundation
import Playgrounds
import SwiftData
import SwiftUI

func populateExamples(context: ModelContext) {
    
    if let ExWords = Bundle.main.path(forResource: "ExampleWords", ofType: "csv") {
        do {
            let contents = try String(contentsOfFile: ExWords)
            let rows = contents.components(separatedBy: .newlines).filter { !$0.isEmpty }
            
            var columns = [String]()
            for (index,row) in rows.enumerated() {
                let words = row.split(separator: ",")
                
                if index == 0 {
                    columns = words.map { String($0) }
                    continue
                }
                
                var main = MainWord(wordKey: String(words[0]), cat: String(words[1]), translation: [])
                context.insert(main)
                var tWords = [Word]()
                for colIndex in 2..<words.count {
                    let tw = Word(mWord: main, lang: columns[colIndex], tranText: String(words[colIndex]))
                    context.insert(tw)
                    tWords.append(tw)
                }
                main.translation = tWords
                // Saved each MainWord and its translations to the context
            }
            
            do {
                try context.save()
            } catch {
                print("Failed to save populated examples: \(error)")
            }
            
        } catch {
            // contents could not be loaded
        }
    } else {
        // example.txt not found!
    }
}
