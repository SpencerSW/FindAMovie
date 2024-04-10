//
//  TrendingResults.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

import Foundation

struct TrendingResults: Decodable {
    let page: Int
    let results: [MovieData]
    let total_pages: Int
    let total_results: Int
}
