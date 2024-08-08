//
//  MediaDetailsCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation
import SwiftUI

class MediaDetailsCoordinator : ObservableObject {
    
    enum MediaListNavigation : Hashable {
        case mediaDetails
    }
    
    private var mediaID : Int64
    private var mediaType : MediaTypeDTO
    private var parentCoordinator: NavigationCoordinator
  
    init(parentCoordinator:NavigationCoordinator,mediaID: Int64, mediaType: MediaTypeDTO) {
        self.parentCoordinator = parentCoordinator
        self.mediaID = mediaID
        self.mediaType = mediaType
    }
    
    func pop() {
        parentCoordinator.path.removeLast()
    }

    @ViewBuilder
    func build(page : MediaListNavigation) -> some View {
        switch page {
        case .mediaDetails:
            MediaDetailsFactory(mediaID: self.mediaID, mediaType: self.mediaType, mediaDetailsCoordinator: self).getMediaDetailsView()
        }
    }
    
}
