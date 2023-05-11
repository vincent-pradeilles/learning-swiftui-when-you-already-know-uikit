//
//  Model.swift
//  Model
//
//  Created by Vincent on 10/09/2021.
//

import Foundation

let apiKey = "da9bc8815fb0fc31d5ef6b3da097a009"

struct Movie: Decodable, Equatable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    var posterURL: URL {
        URL(string: "https://image.tmdb.org/t/p/w154/\(posterPath)")!
    }
}

struct MovieResponse: Decodable {
    let results: [Movie]
}

func loadMovies(page: Int = 1) async -> [Movie] {
    do {
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)&language=en-US&page=\(page)")!
            
        let (data, _) = try await URLSession.shared.data(from: url)
            
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decoded = try decoder.decode(MovieResponse.self, from: data)
        
        return decoded.results
    } catch {
        return []
    }
}
