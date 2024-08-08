//
//  ProfileCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation
import SwiftUI


class ProfileCoordinator: ObservableObject, NavigationCoordinator  {
    
    enum ProfileScreenNavigation : Hashable {
        case profileScreen
        case watchList
        case mediaDetails(id:Int64,mediaType:MediaTypeDTO)
    }
    
    private var parentCoordinator : TabManagerCoordinator
  
    @Published var path = NavigationPath()
    
    init(parentCoordinator: TabManagerCoordinator) {
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
            MediaDetailsCoordinatorView(coordinator: MediaDetailsCoordinator(parentCoordinator: self, mediaID: id, mediaType: mediaType))
        }
    }
    
    func dismiss() {
        parentCoordinator.dismiss()
    }
}
