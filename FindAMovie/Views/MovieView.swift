//
//  MovieView.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

import Foundation
import SwiftUI

struct MovieView: View {
    var movie: MovieData
    let imageBuffer: CGFloat = 280
    @State var genres: [String] = []
    @State var actors: [Actor] = []
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var CustomBackButton : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.clear
            GeometryReader { geometry in
                HStack {
                    if let backdropURL = movie.backdropURL {
                        AsyncImage(url: backdropURL) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: geometry.size.height / 2)
                                .clipped()
                        } placeholder: {
                            Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                                .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        }
                    } else {
                        Rectangle().fill(Color(red:61/255, green: 61/255, blue: 88/255))
                            .frame(width: geometry.size.width, height: geometry.size.height / 2)
                    }
                }
                .cornerRadius(30.0)
            }
            .edgesIgnoringSafeArea(.top)
            
            VStack {
                HStack {
                    Text(movie.title)
                        .font(.title)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                        Text(String(format: "%.1f", movie.vote_average))
                    }
                    .foregroundColor(.yellow)
                    .fontWeight(.heavy)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(genres, id: \.self) { genre in
                            Text(genre)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                                .background(Color(red:61/255, green: 61/255, blue: 88/255))
                                .cornerRadius(10)
                        }
                    }
                }
                HStack {
                    Text("About film")
                        .font(.headline)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                    Spacer()
                    Text("See all")
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                }
                .padding(.top)
                Text(movie.overview)
                    .foregroundColor(.gray)
                    .fontWeight(.semibold)
                    .lineLimit(3...4)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(actors) { actor in
                            ActorCard(actor: actor)
                        }
                    }
                }
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal) // Horizontal padding
            .padding(.top, imageBuffer)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButton, trailing: Button(action: {
            // TO DO: addToFavorites()
        }) {
            Image(systemName: "heart")
                .fontWeight(.heavy)
                .foregroundColor(.red)
        })
        .background(Color(red:39/255, green: 40/255, blue: 59/255).ignoresSafeArea())
        .onAppear() {
            let db = MovieDBViewModel()
            db.getMovieDetails(movieID: String(movie.id)) { genres in
                self.genres = genres!
            }
            db.getMovieCast(movieID: String(movie.id)) { actors in
                self.actors = actors!
                print(self.actors)
            }
        }
    }
}

//MARK: - Get Movie Details
