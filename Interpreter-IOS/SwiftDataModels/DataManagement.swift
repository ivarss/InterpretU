//
//  ExampleData.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-20.
//

import Foundation
import Playgrounds
import SwiftData

/*
 Parses the ExampleWords.csv and populates the passed Model Container in order to display data in memory for any ContentView macro's
 
 :param:    context     The model container passed from the initial location.
 
 */
///  Parses the ExampleWords.csv and populates the passed Model Container with the example words in order to display data in memory for any ContentView macro's
/// - Parameter context: The model Container you pass that only stores data in memory.
func populateExamples(context: ModelContext) {
    if let ExWords = Bundle.main.path(forResource: "ExampleWords", ofType: "csv") {
        do {
            /// Loads the .csv file and tries to parse it into a string
            let contents = try String(contentsOfFile: ExWords)
            /// Row is an array which separates the full string by new line and stores this as individual indexes in its array
            let rows = contents.components(separatedBy: .newlines).filter { !$0.isEmpty }
            /// columns only store the extra primary key of each column (ES, SV, MainWord) in order to use it later when creating the translation objects.
            var columns = [String]()
            /// Iterates through row and splits them by comma then when index is 0 it saves this the current data into the Column Variable
            for (index,row) in rows.enumerated() {
                let words = row.split(separator: ",")
                
                if index == 0 {
                    columns = words.map { String($0) }
                    continue
                }
                
                /// Creates the MainWord object for the current word,
                ///     words[0] = MainWord Key
                ///     words[1] = Category String
                ///     Translation is passed an empty array at this point since the translated words are yet to be created.
                ///     words[2] and onwards is the translated word
                ///     
                var main = MainWord(wordKey: String(words[0]), cat: String(words[1]), translation: [])
                context.insert(main)
                // Create the Translated Word temporary object
                var tWords = [Word]()
                // creates the translated words into the above object array.
                for colIndex in 2..<words.count {
                    let tw = Word(mWord: main, lang: columns[colIndex], tranText: String(words[colIndex]))
                    context.insert(tw)
                    tWords.append(tw)
                }
                main.translation = tWords
                // Saved each MainWord and its translations to the context Model Container
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
