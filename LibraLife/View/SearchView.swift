//
//  SearchView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var searchResults: [Book] = [
        Book(id: UUID(), title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
        Book(id: UUID(), title: "To Kill a Mockingbird", author: "Harper Lee"),
        Book(id: UUID(), title: "1984", author: "George"),
        Book(id: UUID(), title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
        Book(id: UUID(), title: "To Kill a Mockingbird", author: "Harper Lee"),
        Book(id: UUID(), title: "1984", author: "George")
    ]

    init() {
       
        self.searchResults = [
            Book(id: UUID(), title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
            Book(id: UUID(), title: "To Kill a Mockingbird", author: "Harper Lee"),
            Book(id: UUID(), title: "1984", author: "George"),
            Book(id: UUID(), title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
            Book(id: UUID(), title: "To Kill a Mockingbird", author: "Harper Lee"),
            Book(id: UUID(), title: "1984", author: "George")
        ]
    }

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
                        Button(action: {
                            
                            print("Add Book tapped")
                        }) {
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
                    List(searchResults, id: \.id) { book in
                        
                        HStack {
                            Rectangle()
                                .foregroundColor(.gray)
                                .frame(width: 100, height: 140)
                            
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
                                
                                print("Button tapped for book: \(book.title)")
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
        }
    }
        
    private func performSearch() {
        if searchText.isEmpty {
            // If the search text is empty, show all books
            searchResults = [
                Book(id: UUID(), title: "The Great Gatsby", author: "F. Scott Fitzgerald"),
                Book(id: UUID(), title: "To Kill a Mockingbird", author: "Harper Lee"),
                Book(id: UUID(), title: "1984", author: "George"),
            ]
        } else {
            // Filter books based on the search text
            searchResults = searchResults.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

#Preview {
    SearchView()
}
