//
//  MediaItemsListViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation

class MediaItemsListViewModel {
    
    var mediaItemsViewModels : [MediaItemViewModel]
    
    init(mediaItems: [MediaItemDTO]) {
        self.mediaItemsViewModels = mediaItems.map({ mediaItemDTO in
            return MediaItemViewModel(mediaItemDTO: mediaItemDTO)
        })
    }
    
}
