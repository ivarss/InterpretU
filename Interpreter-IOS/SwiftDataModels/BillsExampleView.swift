//
//  ContentView.swift
//  testwords
//
//  Created by Kasper Ivarsson on 2026-01-19.
//

import SwiftUI
import SwiftData
/*
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var mainwords: [MainWord]

    @State var resultword : Word?
    
    func setupwords() {
                
        /*
        let w1m = MainWord(wordKey: "hellotext")
        let w1en = Word(wordKey: "hello", lang: "en", mword: w1m)
        let w1sv = Word(wordKey: "hej", lang: "sv", mword: w1m)
        w1m.translations = [w1en, w1sv]
        modelContext.insert(w1m)
        modelContext.insert(w1en)
        modelContext.insert(w1sv)

        
        let w2m = MainWord(wordKey: "welcometext")
        let w2en = Word(wordKey: "welcome", lang: "en", mword: w2m)
        let w2sv = Word(wordKey: "valkommen", lang: "sv", mword: w2m)
        let w2de = Word(wordKey: "wilcommen", lang: "de", mword: w2m)
        w2m.translations = [w2en, w2sv, w2de]
        modelContext.insert(w2m)
        modelContext.insert(w2en)
        modelContext.insert(w2sv)
        modelContext.insert(w2de)
        */

        /*
        do {
            let predicate = #Predicate<Word> { $0.wordtext == "welcome" && $0.lang == "en" }
            let descriptor = FetchDescriptor<Word>(predicate: predicate)
            let words = try modelContext.fetch(descriptor)
            
            // Check
            
            let translatedword = words.first!.mWord.translations.filter {
                $0.lang == "de"
            }
            
            // Check
            
            resultword = translatedword.first!
            
            
            
            print(words.first!.mWord.translations[0].wordtext)
            print(words.first!.mWord.translations[1].wordtext)

        } catch {
            print("Failed to fetch Word objects: \(error)")
        }
    }
    */

        /*
    
    var body: some View {
        VStack {
            Text("BANAN")
            
            if resultword != nil {
                Text(resultword!.wordtext)
            }
            
            List {
                ForEach(mainwords) { item in
                    VStack {
                        Text("\(item.wordtext)")
                        Text("\(item.translations.count)")
                        
                        ForEach(item.translations) { tword in
                            Text(tword.wordtext)
                        }
                    }
                }
            }
        }
        .onAppear() {
            setupwords()
        }
    }
}

#Preview {
    do {
        let example = try Word(id: "example", text: "Example")
    }
    ContentView()
        .modelContainer(for: [Word.self, MainWord.self], inMemory: true)
}
*/

*/





