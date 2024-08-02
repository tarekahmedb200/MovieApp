//
//  MediaItemViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation


class MediaItemViewModel : Identifiable {
    var id : Int64
    var title: String
    var genre: String
    var posterURL: URL?

    init(mediaItemDTO: MediaItemDTO) {
        id = mediaItemDTO.id
        title = mediaItemDTO.title ?? ""
        genre = mediaItemDTO.genreString ?? ""
        posterURL = mediaItemDTO.posterPathUrl
    }
    
}
