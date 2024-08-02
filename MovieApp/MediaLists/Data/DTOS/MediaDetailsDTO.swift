//
//  MediaDetailsDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation


struct MovieDetailsDTO : Decodable {
    var title: String
    var overview: String
    var rating : Double
    var runTime : Int
    var releaseDate : String
    
    private var genres: [GenreDTO]
    private var posterPath: String
    
    var genreString : String {
        return genres.reduce("") { partialResult, genreDTO in
            return partialResult + " " + genreDTO.name
        }
    }
    
    var posterPathUrl : URL? {
        let urlString = "https://image.tmdb.org/t/p/original/" + posterPath
        return URL(string: urlString)
    }
    
    enum CodingKeys: String , CodingKey {
        case title
        case overview
        case rating = "vote_average"
        case runTime = "runtime"
        case releaseDate = "release_date"
        case genres
        case posterPath = "poster_path"
    }
    
    
}

struct TVShowDetailsDTO : Decodable {
    var name: String
    var overview: String
    var rating : Double
    var firstAiredDate : String
    var numberOfEpisodes : Double?
   
    private var genres: [GenreDTO]
    private var posterPath: String
    
    var genreString : String {
        return genres.reduce("") { partialResult, genreDTO in
            return partialResult + " " + genreDTO.name
        }
    }
    
    var posterPathUrl : URL? {
        let urlString = "https://image.tmdb.org/t/p/original/" + posterPath
        return URL(string: urlString)
    }
    
    enum CodingKeys: String , CodingKey {
        case name
        case overview
        case rating = "vote_average"
        case numberOfEpisodes = "number_of_episodes"
        case firstAiredDate = "first_air_date"
        case genres
        case posterPath = "poster_path"
    }
    
}


struct GenreDTO : Codable {
    var name : String
}



