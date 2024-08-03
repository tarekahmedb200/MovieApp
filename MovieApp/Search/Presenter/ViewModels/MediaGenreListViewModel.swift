//
//  MediaGenreListViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


class MediaGenreListViewModel {
    var mediaItemsViewModels : [MediaGenreItemViewModel]
    
    init(mediaGenreItems: [MediaGenreDTO]) {
        self.mediaItemsViewModels = mediaGenreItems.map({ mediaGenreIDto in
            return MediaGenreItemViewModel(mediaGenreDTO: mediaGenreIDto)
        })
    }
}

