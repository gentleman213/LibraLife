//
//  BookDetailsView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//


import SwiftUI
import SwiftData


struct BookDetailsView: View {
    @Query private var allBookShelf: [Shelf]
    @State private var currentBookIndex: Int = 0
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack() {
            ZStack(alignment: .top) {
                Text(" LibraLife")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
            }
            .padding([.bottom, .trailing], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 0.4784, green: 0.7176, blue: 0.8196))
            Spacer()
            VStack {
                if allBookShelf.isEmpty{
                    VStack{
                        Text("You don't have any books in your shelf")
                            .bold()
                            .padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                        
                    }
                    .foregroundStyle(.gray.opacity(0.7))
                }else{
                    BookView(bookShelf: allBookShelf[currentBookIndex])
                    
                    HStack {
                        Button(action: {
                            if currentBookIndex > 0 {
                                currentBookIndex -= 1
                            }
                        }) {
                            Image(systemName: "chevron.left.circle")
                        }
                        Text("\(currentBookIndex + 1) / \(allBookShelf.count)")
                        Button(action: {
                            if currentBookIndex < allBookShelf.count - 1 {
                                currentBookIndex += 1
                            }
                        }) {
                            Image(systemName: "chevron.right.circle")
                        }
                    }
                    .padding()
                    Button(action: {
                        let bookShelf = allBookShelf[currentBookIndex]
                        modelContext.delete(bookShelf)
                        dismiss()
                        if currentBookIndex == allBookShelf.count-1 && allBookShelf.count>1{
                            currentBookIndex -= 1
                        }
                        
                        
                    }) {
                        Text("Delete")
                            .foregroundColor(.white)
                            .bold()
                            .padding(EdgeInsets(top: 15, leading: 70, bottom: 15, trailing: 70))
                            .background(Color.red)
                            .cornerRadius(25)
                    }
      
                    
                }
            }
            Spacer()
        }
    }
}

struct BookView: View {
    let bookShelf: Shelf
    var body: some View {
        VStack {
            Text(bookShelf.title)
            Image(bookShelf.title)
                .resizable()
                .frame(width: 200, height: 280)
                .background(.gray)

        }
    }
}

#Preview {
    BookDetailsView()
}
