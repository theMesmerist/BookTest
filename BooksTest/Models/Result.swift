//
//  Result.swift
//  BooksTest
//
//  Created by Emre Karaoğlu on 27.09.2022.
//

import Foundation
import UIKit


struct General: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let results: [Result]
}

struct Result: Codable {
    let artistName, id, name, releaseDate: String
    let url: String
    let artworkUrl100: String

    enum CodingKeys: String, CodingKey {
        case artistName, id, name, releaseDate
        case url,artworkUrl100
    }
}
