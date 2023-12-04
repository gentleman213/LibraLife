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
//        VStack {
//            Text("Bookshelf Display").font(.system(size: 32, weight: .bold))
        
        ZStack(alignment: .top) {
            // App Logo Here...
            //Text(" LibraLife")
                //.foregroundColor(.white)
                //.font(.system(size: 32, weight: .bold))
//                    .frame(alignment: .leading)
        }
        .padding([.bottom, .trailing], 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 0.4784, green: 0.7176, blue: 0.8196))
        
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

//        }
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
