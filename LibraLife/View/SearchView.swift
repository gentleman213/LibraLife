//
//  SearchView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import SwiftUI
import SwiftData
import CoreData


struct SearchView: View {
    @State private var searchText: String = ""
    @Query private var allBooks: [Book]
    @Query private var shelf: [Shelf]
    @State private var shelfTitle: [String] = []
    @State private var searchResults: [Book] = []
    @State private var displayFirst = true
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(red: 0.4784, green: 0.7176, blue: 0.8196)
                .frame(height: 120)
                .ignoresSafeArea()
            
            VStack {
                
                ZStack(alignment: .trailing) {
                    TextField("Search a book",text: $searchText, onCommit: performSearch)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color.white)
                        .cornerRadius(5)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                    
                    Button(action: {
                        performSearch()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }.padding(.bottom,30)
                
                Spacer()
                
                if searchResults.isEmpty {
                    VStack(){
                        Text("No matching books were found in the catalog. Click below to manually add the book!")
                            .font(.system(size: 18))
                            .foregroundColor(.gray)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal,50)
                            .padding(.bottom,30)
                        NavigationLink(destination: AddBookView().modelContainer(for: [Book.self,Shelf.self])) {
                            Text("Manually \n Add Book")
                                .font(.system(size: 20, weight: .bold))
                                .padding(.horizontal, 25)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(15)
                        }
                    }
                    Spacer()
                } else {
                    List(searchResults) { book in
                        HStack {
                            Image(book.title)
                                .resizable()
                                .frame(width: 100, height: 140)
                                .background(.gray)
                            Spacer()
                            VStack{
                                Text(book.title)
                                    .font(.system(size: 18, weight: .bold))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(book.author)
                                    .font(.system(size: 16))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Button(action: {
                        
                                shelfTitle = []
                                for currentShelf in shelf {
                                    let currentTitle = currentShelf.title
                                    shelfTitle.append(currentTitle)
                                }
 
                                if !shelfTitle.contains(book.title){
                                    let bookShelve = Shelf(title: book.title, author: book.author)
                                    print(bookShelve)
                                    modelContext.insert(bookShelve)
                                    dismiss()
                                }
          
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.green)
                            }
                            .padding(.trailing, 10)
                        }
                    }
                    .listStyle(PlainListStyle())
                    
                }
            }
            .onAppear(){
                
                let predefinedBooks: [Book] = [
                    Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
                    Book(title: "To Kill a Mockingbird", author: "Harper Lee"),
                    Book(title: "1984", author: "George"),
                    Book(title: "Whispers of the Abyss", author: "Elena Blackwood"),
                    Book(title: "Echoes in Eternity", author: "Adrian Hart"),
                    Book(title: "Silent Symphony", author: "Isabella Nightshade"),
                    Book(title: "The Quantum Cipher", author: "Lucas Quantum"),
                    Book(title: "Beyond the Horizon", author: "Serena Sky"),
                    Book(title: "Chronicles of Nebula", author: "Zara X. Reynolds"),
                    Book(title: "Serenade of Sirens", author: "Elijah Y. Fitzgerald")
                ]
           
                
                if allBooks.isEmpty{
                    for book in predefinedBooks {
                        modelContext.insert(book)
                        dismiss()
                    }
                }
                searchResults = allBooks
            }
        }
    }
    private func performSearch() {
        if searchText.isEmpty {
            // If the search text is empty, show all books
            searchResults = allBooks
        } else {
            // Filter books based on the search text
            searchResults = allBooks.filter {
                $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}

#Preview {
    SearchView()
        .modelContainer(for:[Book.self])
}
