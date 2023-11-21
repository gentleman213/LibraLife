//
//  Book.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import Foundation


struct Book: Identifiable {
    let id: UUID
    let title: String
    let author: String

    init(id: UUID = UUID(), title: String, author: String) {
        self.id = id
        self.title = title
        self.author = author
    }
}
