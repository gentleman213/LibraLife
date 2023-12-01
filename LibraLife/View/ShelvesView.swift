//
//  ShelvesView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//


import SwiftUI
import SwiftData

struct ShelvesView: View {
    @Query private var allBookShelf: [Shelf]

    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack {
            Text("Bookshelf Display").font(.system(size: 32, weight: .bold))
        ZStack {
            Image("shelf")
                .resizable()
                .scaledToFill()
            
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows, alignment: .bottom, spacing: 70) {
                        ForEach(0 ..< allBookShelf.count, id: \.self) { book in
                            ShelfBookView(bookShelf: allBookShelf[book])
                        }
                    }.frame(width:300, height: 590)
                }
            }

        }
    }
}

struct ShelfBookView: View {
    let bookShelf: Shelf
    var body: some View {
        Image(bookShelf.title)
            .resizable()
            .frame(width: 60, height: 95)
            .background(.gray)
    }
}

#Preview {
    ShelvesView()
}
