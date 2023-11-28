//
//  Shelf.swift
//  LibraLife
//
//  Created by Thibaud Barberon on 18/11/2023.
//

import Foundation
import SwiftData


@Model
class Shelf {
    let title: String
    let author: String

    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
}

