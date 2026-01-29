//
//  FavoritePage.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-01-18.
//



 import SwiftUI
 
 struct FavoritePage: View {
 
 let word: FavoritePage.Word   // tar emot ordet
 @State private var searchText: String = ""
 @State private var Title: String = "Sparade ord"
 
 var body: some View {
 VStack {
 Text(Title)
 .padding(30)
 
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
 
 VStack {
 HStack {
 Text(word.swedish)
 .bold()
 
 Spacer()
 
 Text(word.English)
 .bold()
 
 Spacer()
 
 Image(systemName: "star.fill")
 .resizable()
 .symbolRenderingMode(.palette)
 .foregroundStyle(.green)
 .frame(width: 30, height: 30)
 }
 .padding(30)
 .frame(width: 356, height: 70)
 .background(Color.gray.opacity(0.2))
 .cornerRadius(8)
 .padding(.top, 30)
 }
 .frame(maxHeight: .infinity, alignment: .top)
 }
 }
 }
 
 
 #Preview {
 FavoritePage()
 }
 
