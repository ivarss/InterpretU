//
//  Categories.swift
//  SearchWordsApp
//
//  Created by Isabella Heidari on 2025-12-27.
//

import SwiftUI

struct CategoryItem: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
}

struct CategoryView: View {
    
    let sourceLanguage: String
    let targetLanguage: String
    let categories: [CategoryItem] = [
        CategoryItem(title: "JURIDIK", icon: "building.columns"),
        CategoryItem(title: "SJUKVÅRD", icon: "heart.circle"),
        CategoryItem(title: "MIGRATION", icon: "globe.europe.africa.fill"),
        CategoryItem(title: "SAMHÄLLE", icon: "person.3")
    ]
    
    @State private var searchText: String = ""
    
    var body: some View {
            ScrollView {
                Text("Kategorier")
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
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 30),
                        GridItem(.flexible(), spacing: 30)
                    ], spacing: 24) {
                        
                        
                        ForEach(categories) { category in
                            NavigationLink {
                                WordListView(
                                    category: category.title,
                                    sourceLanguage: sourceLanguage,
                                    targetLanguage: targetLanguage
                                )
                            } label: {
                                VStack {
                                    Image(systemName: category.icon)
                                        .resizable()
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.green, .green)
                                        .frame(width: 80, height: 80)
                                    Text(category.title)
                                        . foregroundColor(.black)
                                }
                                .font(.title2)
                                .padding(12)
                                .frame(maxWidth: .infinity, minHeight: 180)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            }
                        }

                        
                        
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
            }
           
        }
    }

#Preview {
    CategoryView(sourceLanguage: "Svenska", targetLanguage: "Engelska")
}
