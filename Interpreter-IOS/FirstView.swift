//
//  FirstView.swift
//
//  Created by Isabella Heidari on 2026-01-07.
//


import SwiftUI
import SwiftData





let languages = ["EN", "ES", "SV", "SO"]

struct FirstView: View {
    @State private var sourceLanguage: String = ""
    @State private var targetLanguage: String = ""
    
    
    @State private var title: String = "Choose language"
    @State private var subtitle: String = "Choose your language and the language you want translate to"
    @State private var translateFrom: String = "Translate from"
    @State private var translateTo: String = "Translate to"
    @State private var LanguageSelectText: String = "Choose language..."
    @State private var buttonText: String = "Continue"
    
    
    
    
    private var isContinueDisabled : Bool {
        sourceLanguage == "" || targetLanguage == ""
        || sourceLanguage == targetLanguage
    }
    
    var body: some View {
            ZStack {
                Color(.systemGray5).ignoresSafeArea() //Ljusgrå bakgrund
                VStack {
                    Text("")
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                NavigationLink(destination: { DataView() }) {
                                    Label("Add Data", systemImage: "plus")
                                }
                            }
                        }
                    Image("EarthGlobe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                    
                    Text(title)
                        .font(Font.title)
                    
                    Text(subtitle)
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.horizontal, 24)
                       
                    
                    Text(translateFrom)
                        .padding(.leading, 60)
                        .padding(.top, 60)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Menu 1: sourceLanguage
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
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.6, green: 0.6, blue: 0.6), lineWidth: 2)
                            }
                        )
                    }
                   
                    
                    Text(translateTo)
                        .padding(.leading, 60)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Menu 2: targetLanguage
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
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.06), radius: 3, x: 0, y: 1)
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(red: 0.6, green: 0.6, blue: 0.6), lineWidth: 2)
                            }
                        )
                    }
             
                    Spacer()
                    
                    NavigationLink(destination: CategoryView(sourceLanguage: sourceLanguage, targetLanguage: targetLanguage)){
                        Text(buttonText)
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.vertical, 16)
                            .frame(maxWidth: 150)
                            .padding(.horizontal,40)
                            .background(isContinueDisabled
                                        ? Color.gray :
                                            
                                            Color(red: 0.0, green: 0.6, blue: 0.35))
                            .clipShape(RoundedRectangle(cornerRadius:14))
                            .multilineTextAlignment(.center)
                        
                        
                    }
                    .disabled(isContinueDisabled)
                    .padding(.bottom, 24)
                }
                
            }
    
        }
        
    }

#Preview {
    FirstView()
        .modelContainer(DataManagement.getExampleContainer())
}
