//
//  MediaItemViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

class MediaItemViewModel : Identifiable, Equatable {
    
    var id : Int64
    var title: String
    var genre: String
    var posterURL: URL?
    
    init(mediaItemDTO: MediaItemDTO) {
        id = mediaItemDTO.id
        title = mediaItemDTO.title ?? ""
        
        if let firstGenre = mediaItemDTO.genres.first,
            let genreString = Genre(rawValue: firstGenre) {
            genre = genreString.stringValue
        }else {
            genre = ""
        }
        
        if let posterPath = mediaItemDTO.posterPath {
            posterURL = URL(string: "https://image.tmdb.org/t/p/w200/" + posterPath)
        }
    }
    
    static func == (lhs: MediaItemViewModel, rhs: MediaItemViewModel) -> Bool {
        lhs.id == rhs.id
    }
}

