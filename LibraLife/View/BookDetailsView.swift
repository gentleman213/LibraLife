//
//  BookDetailsView.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import SwiftUI

struct BookDetailsView: View {
    @State private var bookTitle: String = ""
    @State private var author: String = ""
    @State private var description: String = ""
    @State private var volumeNumber: String = ""
    @State private var save = false
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .top) {
                // App Logo Here...
                Text(" LibraLife")
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
//                    .frame(alignment: .leading)
            }
            .padding([.bottom, .trailing], 20)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(red: 0.4784, green: 0.7176, blue: 0.8196))
            
            VStack {
                Text("Fill Out the Details")
                    .bold()
                    .padding([.bottom, .top], 20)
                
                Text("Title")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                TextField("Title", text: $bookTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
//                Spacer()
                
                Text("Author")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                TextField("Author", text: $author)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
//                Spacer()
                
                Text("Description")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                TextField("Description", text: $description, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .lineLimit(5, reservesSpace: true)
                    .padding()
                
//                Spacer()
                
                Text("Volume Number")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 18)
                TextField("Volume Number", text: $volumeNumber)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Save") {
                    save.toggle()
                }
                    .padding()
                    .background(Color(red: 1.0, green: 0.5, blue: 0.0))
                    .foregroundStyle(.white)
                    .clipShape(Capsule())

                if save {
                    // action here if clicked
                    Text("Hello World!")
                }
                
                Spacer()    // do NOT modify this!
            }
        }
    }
}


#Preview {
    BookDetailsView()
}
