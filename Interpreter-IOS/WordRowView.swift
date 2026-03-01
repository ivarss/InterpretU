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
    let sourceLanguage: String
    let targetLanguage: String
    
    var sourceText: String {
        mainWord.translation.first {
            $0.lang == sourceLanguage
        }?.tranText ?? ""
    }

    var targetText: String {
        mainWord.translation.first {
            $0.lang == targetLanguage
        }?.tranText ?? ""
    }


    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Leading accent and languages
            VStack(alignment: .leading, spacing: 6) {
                // Source text with a small language badge
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(sourceLanguage)
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color.blue.opacity(0.12))
                        .foregroundStyle(.blue)
                        .clipShape(Capsule())
                    Text(sourceText)
                        .font(.system(size: 18, weight: .semibold))
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }

                // Divider line between languages
                Divider()
                    .opacity(0.2)

                // Target text with a small language badge
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    Text(targetLanguage)
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 3)
                        .background(Color.green.opacity(0.12))
                        .foregroundStyle(.green)
                        .clipShape(Capsule())
                    Text(targetText)
                        .font(.system(size: 18))
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            // Favorite star on the trailing side
            Button(action: {
                mainWord.isFavorite.toggle()
            }) {
                Image(systemName: mainWord.isFavorite ? "star.fill" : "star")
                    .font(.title3)
                    .foregroundStyle(mainWord.isFavorite ? .yellow : .secondary)
                    .padding(8)
                    .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 2)
        )
        .frame(maxWidth: 356, alignment: .leading)
        
    }
}


 #Preview {
     WordRowView(mainWord: DataManagement.getaword(), sourceLanguage: "SV", targetLanguage: "ES"  )
         .modelContainer(DataManagement.getExampleContainer())
 }
 

