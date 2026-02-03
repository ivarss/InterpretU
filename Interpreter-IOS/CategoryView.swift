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
        CategoryItem(title: "LAW", icon: "building.columns"),
        CategoryItem(title: "HEALTHCARE", icon: "heart.circle"),
        CategoryItem(title: "MIGRATION", icon: "globe.europe.africa.fill"),
        CategoryItem(title: "SOCIETY", icon: "person.3")
    ]
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.systemGray5).ignoresSafeArea()
                
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
                                    .foregroundStyle(.white, Color(red: 0.0, green: 0.55, blue: 0.25))
                                    .frame(width: 50, height: 50)
                                Spacer()
                                Text(targetLanguage)
                            }
                            .padding(.horizontal, 50)
                        }
                        
                        // Search bar
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease")
                            
                            
                            
                            TextField("Search word...", text: $searchText)
                                .multilineTextAlignment(.center)
                            
                            Image(systemName: "magnifyingglass")
                            
                        }
                        .padding(20)
                        .background(Color.green.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.horizontal)
                        
                        
                        // Categories grid-like layout
                        LazyVGrid(columns:
                                    [
                                        GridItem(.flexible(), spacing: 30),
                                        GridItem(.flexible(), spacing: 30)
                                    ], spacing: 24)
                        {
                            
                            
                            
                            ForEach(categories, id: \.id) { category in
                                VStack {
                                    
                                    
                                    Image(systemName: category.icon)
                                        .resizable()
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(
                                            Color(red: 0.0, green: 0.55, blue: 0.25),   // primär (mörkare grön)
                                            Color(red: 0.0, green: 0.55, blue: 0.25)    // sekundär (samma ton)
                                        )
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                        .padding(16)
                                        .background(
                                            Circle()
                                                .fill(Color.green.opacity(0.2)) //grön färg i cirkeln
                                                .overlay(
                                                    Circle()
                                                        .stroke(Color.gray, lineWidth: 1)
                                                )
                                        )  //linje runt cirkel
                                    
                                    Text(category.title)
                                }
                                
                                
                                .font(.title2)
                                .padding(12)
                                .frame(maxWidth: .infinity, minHeight: 210)
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.gray, lineWidth: 1)
                                )
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal)
                    }
                    .padding(.vertical)
                }
                .scrollContentBackground(.hidden)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    CategoryView(sourceLanguage: "English", targetLanguage: "Svenska")
}
