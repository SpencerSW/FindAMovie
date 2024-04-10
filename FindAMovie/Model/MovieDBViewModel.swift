//
//  MovieDBViewModel.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

import Foundation

@MainActor
class MovieDBViewModel: ObservableObject {
    @Published var trending: [MovieData] = []
    @Published var searchResults: [MovieData] = []
    @Published var movieDetails: [MovieDetails] = []
    @Published var movieCast: [MovieCast] = []
    static let apiKey = "c55610cd23cd82543f2515fd145b2412"
    
    func loadTrending() {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/trending/movie/day?api_key=\(MovieDBViewModel.apiKey)")!
           
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults =  try JSONDecoder().decode(TrendingResults.self, from: data)
                trending = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func search(term: String) {
        Task {
            let url = URL(string: "https://api.themoviedb.org/3/search/movie?api_key=\(MovieDBViewModel.apiKey)&language=en-US&page=1&include_adult=false&query=\(term)")!
           
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let trendingResults =  try JSONDecoder().decode(TrendingResults.self, from: data)
                searchResults = trendingResults.results
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func getMovieDetails(movieID: String, completion: @escaping ([String]?) -> Void) {
        Task {
            do {
                let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=\(MovieDBViewModel.apiKey)")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let movieDetails = try JSONDecoder().decode(MovieDetails.self, from: data)
                self.movieDetails = [movieDetails]
                let genreNames = movieDetails.genres.map { $0.name }
                completion(genreNames)
            } catch {
                print("Error fetching movie details:", error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func getMovieCast(movieID: String, completion: @escaping ([Actor]?) -> Void) {
        Task {
            do {
                let url = URL(string: "https://api.themoviedb.org/3/movie/\(movieID)/credits?api_key=\(MovieDBViewModel.apiKey)")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let movieCast = try JSONDecoder().decode(MovieCast.self, from: data)
                self.movieCast = [movieCast]
                let actors = movieCast.cast
                completion(actors)
            } catch {
                print("Error fetching movie cast:", error.localizedDescription)
                completion(nil)
            }
        }
    }
}
