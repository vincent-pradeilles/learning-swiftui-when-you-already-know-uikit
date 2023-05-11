//
//  ContentView.swift
//  SwiftUI iOS 15
//
//  Created by Vincent on 10/09/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var movies = [Movie]()
    @State var filter = ""
    @State var movieToShare: Movie? = nil
    @State var currentPage = 1
    
    var filteredMovies: [Movie] {
        if filter.isEmpty {
            return movies
        } else {
            return movies.filter { $0.title.hasPrefix(filter) }
        }
    }
    
    var body: some View {
        List(filteredMovies) { movie in
            HStack(spacing: 10) {
                AsyncImage(url: movie.posterURL) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.overview)
                        .lineLimit(3)
                        .font(.subheadline)
                }
            }
            .sheet(item: $movieToShare) { movie in
                ShareSheet(activityItems: [movie.title, movie.overview])
            }
            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                Button(action: {
                    movieToShare = movie
                }) {
                    Label("Share",
                          systemImage: "square.and.arrow.up")
                }
                .tint(Color.yellow)
            }
            .task {
                if movie == movies.last {
                    currentPage += 1
                    movies += await loadMovies(page: currentPage)
                }
            }
        }
        .task {
            movies = await loadMovies()
        }
        .refreshable {
            movies = await loadMovies().shuffled()
        }
        .navigationTitle("Upcoming")
        .searchable(text: $filter, prompt: "Filter")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
