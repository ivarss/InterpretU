//
//  ContentView.swift
//  Interpreter-IOS
//
//  Created by Kasper Ivarsson on 2026-01-14.
//
// This is more or less just a way for us to actually load and display data from the database. More so as a debugging tool later on, Currently though it is not functional.

import SwiftUI
import SwiftData
import ToastKit

/// The SwiftUI view to view all the data passed into swiftdata.
struct DataView: View {
    @Environment(\.modelContext) var modelContext
    @Query var mainWords: [MainWord]
    var body: some View {
        // TODO: Make a button to manually add live data from csv file.
        // TODO: Make a button to manually delete current live data.
        // TODO: Navigation to this screen from somewhere in our live project.
        // TODO: Make the UI cleaner, add Frame limits to each section so they seperate nicely.
        
        NavigationStack() {
            Text("Manage the Swiftdata storage")
                .navigationTitle("Data View")
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                                    ToastKit.present(message: "Added Live-Data", color: Color.yellow) // Step 2
                                }, label: {
                                    Text("Add Data")
                                })
                                .onAppear {
                                    ToastKit.configure(type: .liquid) // Step 1
                                }
                            }
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                                    ToastKit.present(message: "Deleted all Live-Data", color: Color.yellow) // Step 2
                                }, label: {
                                    Text("Delete Data")
                                })
                                .onAppear {
                                    ToastKit.configure(type: .liquid) // Step 1
                                }
                            }
                        }
        
        // List to display all the Main words we have and each of their translated words and the languages for it.
        List {
            ForEach(mainWords) { mainWord in
                HStack {
                    VStack(alignment: .leading) {
                        Text("Main")
                        Text(mainWord.wordKey)
                    }
                    VStack(alignment: .center) {
                        Text("Category")
                        Text(mainWord.cat)
                    }
                    Spacer()
                        DisclosureGroup {
                            ForEach(mainWord.translation) { tranWord in
                                VStack{
                                    
                                    HStack {
                                        Text(tranWord.lang + ": ")
                                        Text(tranWord.tranText)
                                    }
                                }
                            }
                        } label: {
                            Spacer()
                            VStack(alignment: .trailing) {
                            Text("Translations: ")
                            Text(String(mainWord.translation.count))
                        }
                    }
                }
            }
        }
        }
    }
}

#Preview {
    return DataView()
        .modelContainer(DataManagement.getExampleContainer())
}

