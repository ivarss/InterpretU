//
//  FirstView.swift
//  SearchWordsApp
//
//  Created by Isabella Heidari on 2026-01-07.
//


import SwiftUI





let languages = ["English 🇬🇧", "Español 🇪🇸", "Castellaño 🇵🇪", "Svenska 🇸🇪", "Soomaali 🇸🇴"]

struct FirstView: View {
    @State private var sourceLanguage: String = ""
    @State private var targetLanguage: String = ""
    
    
    @State private var title: String = "Välj språk"
    @State private var subtitle: String = "Välj ditt språk och språket du översätter till"
    @State private var translateFrom: String = "Översätt från"
    @State private var translateTo: String = "Översätt till"
    @State private var LanguageSelectText: String = "Välj språk..."
    @State private var buttonText: String = "Fortsätt"

    
    
    
    private var isContinueDisabled : Bool {
        sourceLanguage == "" || targetLanguage == ""
        || sourceLanguage == targetLanguage
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Image("framsidebildApp")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 180, height: 180)
                Text(title)
                    .font(Font.title)
                
                Text(subtitle)
                    .font(.title2)
                    .padding()
                
                Text(translateFrom)
                    .padding(.leading, 60)
                    .padding(.top, 60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Menu {
                    ForEach(languages, id: \.self) { language in
                        Button(language) {
                            sourceLanguage = language
                        }
                    }
                } label: {
                    HStack {
                        Text(sourceLanguage.isEmpty ? LanguageSelectText : sourceLanguage)
                            .foregroundColor(sourceLanguage == "" ? .gray : .primary)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: 280)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
                .padding()
                
                Text(translateTo)
                    .padding(.leading, 60)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Menu {
                    ForEach(languages, id: \.self) { language in
                        Button(language) {
                            targetLanguage = language
                        }
                    }
                } label: {
                    HStack {
                        Text(targetLanguage.isEmpty ? LanguageSelectText : targetLanguage)
                            .foregroundColor(targetLanguage == "" ? .gray : .primary)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .frame(maxWidth: 280)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(Color.gray))
                }
                .padding()
                
                NavigationLink(destination:CategoriView(sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)){
                    Text(buttonText)
                        .padding(20)
                        .foregroundColor(.white)
                        .background(isContinueDisabled ? Color.gray : Color.green)
                        .clipShape(RoundedRectangle(cornerRadius:20))
                        .multilineTextAlignment(.center)
                        .font(.title2)
                }.disabled(isContinueDisabled)
                
            }
        }}
}


#Preview {
    FirstView()
}
