//
//  ProfileCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation
import SwiftUI


class ProfileCoordinator: ObservableObject {
    
    enum ProfileScreenNavigation : Hashable {
        case profileScreen
        case watchList
        case mediaDetails(id:Int64,mediaType:MediaTypeDTO)
    }
    
    private var parentCoordinator : HomeCoordinator
  
    @Published var path = NavigationPath()
    
    init(parentCoordinator: HomeCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func push(page:ProfileScreenNavigation) {
        path.append(page)
    }
    
    @ViewBuilder
    func build(page : ProfileScreenNavigation) -> some View {
        switch page {
        case .profileScreen:
            ProfileFactory(profileCoordinator: self).getProfileView()
        case .watchList:
            WatchListFactory(profileCoordinator: self).getWatchListView()
        case .mediaDetails(let id,let mediaType):
            MediaDetailsCoordinatorView(coordinator: MediaDetailsCoordinator(mediaID: id, mediaType: mediaType))
        }
    }
    
    func dismiss() {
        parentCoordinator.dismiss()
    }

}