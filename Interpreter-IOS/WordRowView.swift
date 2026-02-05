//
//  WordRowView.swift
//  Interpreter-IOS
//
//  Created by Mahamed Adan on 2026-01-31.
//

import SwiftUI
import SwiftData

struct WordRowView: View {
    @Bindable var mainWord: MainWord  // @Bindable för att kunna ändra

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(mainWord.wordKey)
            }
            Spacer()
            
            // Dina översättningar...
            ForEach(mainWord.translation) { tranWord in
                Text(tranWord.tranText)
            }
            Spacer()
            // Stjärna till höger
            Button(action: {
                mainWord.isFavorite.toggle()
            }) {
                Image(systemName: mainWord.isFavorite ? "star.fill" : "star")
                    .foregroundStyle(mainWord.isFavorite ? .green : .gray)
            }
            .buttonStyle(.plain)  // För att undvika default-stil

        }
        .padding(20)
        .frame(width: 356, height: 70)
        .background(Color.white)
        .cornerRadius(8)
        
    }
}

/*
 #Preview {
 WordRowView()
         .modelContainer(DataManagement.getExampleContainer())
 }
 */
