//
//  ContentView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
            // Search View
            NavigationView {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            // Shelves View
            NavigationView {
                ShelvesView()
            }
            .tabItem {
                Label("Shelves", systemImage: "house")
            }

            // Book Details View
            NavigationView {
                BookDetailsView()
            }
            .tabItem {
                Label("Details", systemImage: "book")
            }
            

        }
        .modelContainer(for: [Book.self, Shelf.self])
        .accentColor(Color.black)
    }
}


#Preview {
    ContentView()
}
