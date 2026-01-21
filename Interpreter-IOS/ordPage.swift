////
//  ordPagae.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-01-17.
//

import SwiftUI

struct ordPage: View {
    struct Word: Identifiable {
        let id = UUID()
        let swedish: String
        let English: String
    }

    let words: [Word] = [
        Word(swedish: "hund", English: "dog"),
        Word(swedish: "katt", English: "cat"),
        Word(swedish: "hus", English: "house"),
        Word(swedish: "bil", English: "car")
    ]

    @State private var searchText: String = ""
    @State private var title: String = "Sjukvård"

    private var filteredWords: [Word] {
        if searchText.isEmpty {
            return words
        } else {
            return words.filter { word in
                word.swedish.localizedCaseInsensitiveContains(searchText) ||
                word.English.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                
                    // Sök rutan
                    HStack {
                        Image(systemName: "line.3.horizontal.decrease")
                            .foregroundColor(.gray)
                        

                        TextField("Sök ord...", text: $searchText)
                            .multilineTextAlignment(.center)

                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    .padding(20)
                    .background(Color.green.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.horizontal)

                    
                    VStack(alignment: .leading, spacing: 12) {
                       

                        ForEach(filteredWords) { word in
                            HStack {
                                Text(word.swedish)
                                    .bold()
                                Spacer()
                                Text(word.English)
                                    .bold()
                                Spacer()
                                NavigationLink(destination: SparaPage(word: word)) {
                                    Image("StarIcon")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                }
                                
                            }
                            .padding(30)
                            .frame(width: 356, height: 70)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.top, 30)

                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 24)
                }
                .frame(maxWidth: .infinity, alignment: .top)
            }
            .navigationTitle($title)
        }
    }
}

#Preview {
    ordPage()
}

                   
              
