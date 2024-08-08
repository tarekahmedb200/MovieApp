//
//  MediaItemsListViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation
import SwiftUI

class MediaItemsListViewModel  {
    
    var mediaItemRowStyleViewModels: [MediaItemViewModel]
    
    init(mediaItems: [MediaItemDTO]) {
        self.mediaItemRowStyleViewModels = mediaItems.map({ mediaItemDTO in
            return MediaItemViewModel(mediaItemDTO: mediaItemDTO)
        })
    }
    
}
