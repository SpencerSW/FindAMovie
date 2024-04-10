//
//  SearchCard.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

import Foundation
import SwiftUI

struct SearchCard: View {
    var searchItem: MovieData
    
    var body: some View {
        NavigationLink(destination: MovieView(movie: searchItem)) {
            HStack {
                AsyncImage(url: searchItem.backdropURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 100)
                        .clipped()
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 100)
                }
                VStack {
                    HStack {
                        Text(searchItem.title)
                            .foregroundColor(.white)
                            .font(.title)
                            .lineLimit(1)
                        Spacer()
                        HStack {
                            Image(systemName: "hand.thumbsup.fill")
                            Text(searchItem.vote_average != 0 ? String(format: "%.1f", searchItem.vote_average) : "TBD")
                        }
                        .foregroundColor(.yellow)
                        .fontWeight(.heavy)
                    }
                    Spacer()
                    Text(searchItem.overview)
                        .foregroundColor(.white)
                        .lineLimit(2)
                }
                Spacer()
            }
            .background(Color(red:61/255, green: 61/255, blue: 88/255))
            .cornerRadius(10)
            .padding(.horizontal)
        }
    }
}

