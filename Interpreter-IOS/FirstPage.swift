//
//  FirstPage.swift
//  SearchWordsApp
//
//  Created by Isabella Heidari on 2026-01-07.
//


import SwiftUI





let languages = ["English 🇬🇧", "Español 🇪🇸", "Castellaño 🇵🇪", "Svenska 🇸🇪", "Soomaali 🇸🇴"]

struct FirstPage: View {
    @State private var sourceLanguage: String = ""
    @State private var targetLanguage: String = ""
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
                Text("Välj språk")
                    .font(Font.title)
                
                Text("Välj ditt språk och språket du översätter till")
                    .font(.title2)
                    .padding()
                
                Text("Översätt från")
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
                        Text(sourceLanguage == "" ? "Välj språk..." : sourceLanguage)
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
                
                Text("Översätt till")
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
                        Text(targetLanguage == "" ? "Välj språk...": targetLanguage)
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
                
                NavigationLink(destination:CategoryPage(sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)){
                    Text("Fortsätt")
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
    FirstPage()
}


