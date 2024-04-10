//
//  ContentView.swift
//  FindAMovie
//
//  Created by Spencer McLaughlin on 4/9/24.
//

// TO DO: addToFavorites()

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MovieDBViewModel()
    
    @State var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                if searchText.isEmpty {
                    HStack {
                        Text("Favorites")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if false {
//                                ForEach(viewModel.favorites) { trendingItem in
//                                    MovieCard(movie: trendingItem)
//                                }
                            } else {
                                VStack() {
                                    Image(systemName: "plus.square.on.square")
                                        .frame(width: 250, height: 140)
                                        .font(.system(size: 80, weight: .light))
                                    Text("Add favorites")
                                        .fontWeight(.heavy)
                                }
                                .padding()
                                .background(Color(red:61/255, green: 61/255, blue: 88/255))
                                .cornerRadius(10.0)
                                .onTapGesture(perform: {
                                    searchText = "The Dark Knight"
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    HStack {
                        Text("Trending")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                        Spacer()
                    }
                    .padding(.horizontal)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(viewModel.trending) { trendingItem in
                                MovieCard(movie: trendingItem)
                            }
                        }
                        .padding(.horizontal)
                    }
                } else {
                    LazyVStack {
                        ForEach(viewModel.searchResults) { searchItem in
                            SearchCard(searchItem: searchItem)
                        }
                    }
                }
            }
            .background(Color(red:39/255, green: 40/255, blue: 59/255).ignoresSafeArea())
        }
        .searchable(text: $searchText)
        .onChange(of: searchText) {
            if searchText.count > 0 {
                viewModel.search(term: searchText)
            }
        }
        .onAppear {
            viewModel.loadTrending()
            viewModel.search(term: "")
        }
    }
}

#Preview {
    ContentView()
}
