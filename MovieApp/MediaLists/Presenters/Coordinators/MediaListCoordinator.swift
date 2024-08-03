//
//  MediaListCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation
import SwiftUI

class MediaListCoordinator : ObservableObject {
    
    enum MediaListNavigation : Hashable {
        case mediaList
        case mediaDetails(id:Int64,mediaType:MediaTypeDTO)
    }
    
    private var parentCoordinator : HomeCoordinator
  
    
    @Published var path = NavigationPath()
    
    init(parentCoordinator: HomeCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func pop() {
        path.removeLast()
    }
    
    func push(page:MediaListNavigation) {
        path.append(page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page : MediaListNavigation) -> some View {
        switch page {
        case .mediaList:
            MediaListFactory(mediaListCoordinator: self).getMediaListView()
        case .mediaDetails(let id,let mediaType):
            MediaDetailsCoordinatorView(coordinator: MediaDetailsCoordinator(mediaID: id, mediaType: mediaType))
        }
    }
    
}
