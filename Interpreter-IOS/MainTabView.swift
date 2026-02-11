//
//  MainTabView.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-02-06.
//

import SwiftUI

struct MainTabView: View {
    
    let sourceLanguage: String
    let targetLanguage: String
    
    var body: some View {
        NavigationStack {
            TabView {
                
                CategoryView(
                    sourceLanguage: sourceLanguage,
                    targetLanguage: targetLanguage
                )
                .tabItem {
                    Label("Kategorier", systemImage: "square.grid.2x2")
                }
                
                FavoriteView(
                    sourceLanguage: sourceLanguage,
                    targetLanguage: targetLanguage
                )
                .tabItem {
                    Label("Favoriter", systemImage: "star.fill")
                }
                
            }
        }
    }
    
    
    
}
