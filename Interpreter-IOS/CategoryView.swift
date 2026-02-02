//
//  Categories.swift
//  SearchWordsApp
//
//  Created by Isabella Heidari on 2025-12-27.
//

import SwiftUI

struct CategoryView: View {
    
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
                            Image(systemName: "arrow.right.circle.fill")
                                .resizable()
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .green)
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
                                Image(systemName: "building.columns")
                                    .resizable()
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.green, .green)
                                    .frame(width: 80, height: 80)
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
                                Image(systemName: "heart.circle")
                                    .resizable()
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.green, .green)
                                    .frame(width: 80, height: 80)
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
                                Image(systemName: "globe.europe.africa.fill")
                                    .resizable()
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.green, .green)
                                    .frame(width: 80, height: 80)
                                Text("MIGRATION")
                            }
                            .padding(12)
                            .frame(width: 150, height: 180)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            
                            VStack {
                                Image(systemName: "person.3")
                                    .resizable()
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.green, .green)
                                    .frame(width: 80, height: 80)
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
    CategoryView(sourceLanguage: "Svenska", targetLanguage: "Engelska")
}
