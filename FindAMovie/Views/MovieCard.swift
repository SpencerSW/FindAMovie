//
//  MovieCard.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

import Foundation
import SwiftUI

struct MovieCard: View {
    var movie: MovieData
    
    var body: some View {
        NavigationLink(destination: MovieView(movie: movie)) {
            ZStack(alignment: .bottom) {
                if let backdropURL = movie.backdropURL {
                    AsyncImage(url: backdropURL) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 280, height: 200)
                    } placeholder: {
                        Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                            .frame(width: 280, height: 200)
                    }
                } else {
                    Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                        .frame(width: 280, height: 200)
                }
                
                VStack {
                    HStack {
                        Text(movie.title)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        Spacer()
                        Image(systemName: "heart")
                            .foregroundColor(.red)
                            .fontWeight(.heavy)
                    }
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                        Text(String(format: "%.1f", movie.vote_average))
                        Spacer()
                    }
                    .foregroundColor(.yellow)
                    .fontWeight(.heavy)
                }
                .padding()
                .background(Color(red:61/255, green: 61/255, blue: 88/255))
            }
            .cornerRadius(10.0)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
