//
//  MovieCast.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/10/24.
//

import Foundation

struct MovieCast: Identifiable, Decodable {
    var id: Int
    let cast: [Actor]
}

struct Actor: Identifiable, Decodable {
    let adult : Bool
    let gender: Int
    let id: Int
    let known_for_department: String
    let name: String
    let original_name: String
    let popularity: Double
    let profile_path: String?
    let cast_id: Int
    let character: String
    let credit_id: String
    let order: Int
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
        return baseURL.appending(path: profile_path ?? "")
    }
}
