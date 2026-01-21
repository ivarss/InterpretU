//
//  Categories.swift
//  SearchWordsApp
//
//  Created by Isabella Heidari on 2025-12-27.
//

import SwiftUI

struct CategoryPage: View {
    
    let sourceLanguage: String
    let targetLanguage: String
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    // Header with languages and arrow
                    VStack {
                        HStack {
                            Text(sourceLanguage)
                            Spacer()
                            Image("arrowRight")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                            Spacer()
                            Text(targetLanguage)
                        }
                        .padding(.horizontal, 50)
                    }
                    
                    // Search bar
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
                    
                    // Categories grid-like layout
                    VStack(spacing: 24) {
                        // Row 1: Juridik & Sjukvård
                        HStack(spacing: 30) {
                            // Juridik
                            VStack {
                                Image("juridikSymbol")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("JURIDIK")
                            }
                            .padding(12)
                            .frame(width: 150, height: 180)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            
                            // Sjukvård
                            VStack {
                                Image("sjukvardSymbol")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("SJUKVÅRD")
                            }
                            .padding(12)
                            .frame(width: 150, height: 180)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                        .font(.title2)
                        
                        // Row 2: Migration & Samhälle
                        HStack(spacing: 30) {
                            VStack {
                                Image("migrationSymbol")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("MIGRATION")
                            }
                            .padding(12)
                            .frame(width: 150, height: 180)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            
                            VStack {
                                Image("samhalleSymbol")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                Text("SAMHÄLLE")
                            }
                            .padding(12)
                            .frame(width: 150, height: 180)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                        }
                        .font(.title2)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
            .navigationTitle("Kategorier")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CategoryPage(sourceLanguage: "Svenska", targetLanguage: "Engelska")
}
