//
//  MovieDetails.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/10/24.
//

import Foundation

struct MovieDetails: Identifiable, Decodable {
    var id: Int
    let genres: [Genre]
}

struct Genre: Decodable {
    let id: Int
    let name: String
}

