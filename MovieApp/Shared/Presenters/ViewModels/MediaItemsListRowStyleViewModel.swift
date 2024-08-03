//
//  MediaItemsListRowStyleViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation
import SwiftUI

class MediaItemsListRowStyleViewModel  {
    
    var mediaItemRowStyleViewModels: [MediaItemRowStyleViewModel]
    
    init(mediaItems: [MediaItemDTO]) {
        self.mediaItemRowStyleViewModels = mediaItems.map({ mediaItemDTO in
            return MediaItemRowStyleViewModel(mediaItemDTO: mediaItemDTO)
        })
    }
    
}
