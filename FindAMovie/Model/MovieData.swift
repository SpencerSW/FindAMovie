//
//  MovieData.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

import Foundation

struct MovieData: Identifiable, Decodable {
    
    let adult: Bool
    let id: Int
    let poster_path: String?
    let title: String
    let vote_average: Float
    let backdrop_path: String?
    let overview: String
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")!
        return baseURL.appending(path: backdrop_path ?? "")
    }
    
    var posterThumbnail: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")!
        return baseURL.appending(path: poster_path ?? "")
    }
}
