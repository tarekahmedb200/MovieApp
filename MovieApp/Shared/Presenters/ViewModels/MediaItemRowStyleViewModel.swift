//
//  MediaItemRowStyleViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

class MediaItemRowStyleViewModel : Identifiable, Equatable {
    
    static func == (lhs: MediaItemRowStyleViewModel, rhs: MediaItemRowStyleViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    var id : Int64
    var title: String
    var genre: String
    var posterURL: URL?

    init(mediaItemDTO: MediaItemDTO) {
        id = mediaItemDTO.id
        title = mediaItemDTO.title ?? ""
        genre = mediaItemDTO.genreString
        posterURL = mediaItemDTO.posterPathUrl
    }
}

