//
//  Categories.swift
//  SearchWordsApp
//
//  Created by Isabella Heidari on 2025-12-27.
//

import SwiftUI
import SwiftData

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
    @Environment(\.modelContext) private var modelContext

    // Hämtar alla ord som matchar söktexten i:
    // - MainWord.wordKey
    // - Word.tranText för endast sourceLanguage och targetLanguage
    // Sökningen är case-insensitive och oberoende av kategori.
    private var filteredWords: [MainWord] {
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return [] }
        do {
            let predicate = #Predicate<MainWord> { main in
                (
                    main.wordKey.localizedStandardContains(trimmed)
                ) || (
                    main.translation.contains { t in
                        (t.lang == sourceLanguage || t.lang == targetLanguage) &&
                        t.tranText.localizedStandardContains(trimmed)
                    }
                )
            }
            let descriptor = FetchDescriptor<MainWord>(predicate: predicate)
            return try modelContext.fetch(descriptor)
        } catch {
            print("Search fetch failed: \(error)")
            return []
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color(.systemGray5).ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 16) {
                        // Header med språk och pil
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
                        
                        // Sökfält
                        HStack {
                            Image(systemName: "line.3.horizontal.decrease")
                            
                            TextField("Search word...", text: $searchText)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled(true)
                                .multilineTextAlignment(.center)
                            
                            Image(systemName: "magnifyingglass")
                            
                        }
                        .padding(20)
                        .background(Color.green.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .padding(.horizontal)
                        
                        // Om det finns söktext: visa resultat inline
                        if !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                            // Resultatlista
                            VStack(alignment: .leading, spacing: 12) {
                                // Valfritt: rubrik för resultat
                                // Text("Resultat").font(.headline).padding(.horizontal)
                                
                                ForEach(filteredWords) { mainWord in
                                    WordRowView(
                                        mainWord: mainWord,
                                        sourceLanguage: sourceLanguage,
                                        targetLanguage: targetLanguage
                                    )
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                        } else {
                            // Annars: visa kategorier
                            LazyVGrid(columns:
                                        [
                                            GridItem(.flexible(), spacing: 5),
                                            GridItem(.flexible(), spacing: 5)
                                        ], spacing: 24)
                            {
                                ForEach(categories, id: \.id) { category in
                                    NavigationLink {
                                        WordListView(
                                            category: category.title,
                                            sourceLanguage: sourceLanguage,
                                            targetLanguage: targetLanguage
                                        )
                                    }
                                    label: {
                                        VStack {
                                            Image(systemName: category.icon)
                                                .resizable()
                                                .symbolRenderingMode(.palette)
                                                .foregroundStyle(
                                                    Color(red: 0.0, green: 0.55, blue: 0.25),
                                                    Color(red: 0.0, green: 0.55, blue: 0.25)
                                                )
                                                .scaledToFit()
                                                .frame(width: 60, height: 60)
                                                .padding(16)
                                                .background(
                                                    Circle()
                                                        .fill(Color.green.opacity(0.2))
                                                        .overlay(
                                                            Circle()
                                                                .stroke(Color.gray, lineWidth: 1)
                                                        )
                                                )
                                            
                                            Text(category.title)
                                                .foregroundColor(.black)
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
                    }
                    .scrollContentBackground(.hidden)
                    .navigationBarTitleDisplayMode(.inline)
                }
            }
        }
    }
}

#Preview {
    CategoryView(sourceLanguage: "SV", targetLanguage: "EN")
}

