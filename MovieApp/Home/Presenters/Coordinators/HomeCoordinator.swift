//
//  HomeCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation
import SwiftUI

class HomeCoordinator : ObservableObject, NavigationCoordinator {
    
    enum HomeNavigation : Hashable {
        case homeScreen
        case mediaDetails(id:Int64,mediaType:MediaTypeDTO)
    }
    
    private var parentCoordinator: TabManagerCoordinator
  
    @Published var path = NavigationPath()
    
    init(parentCoordinator: TabManagerCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func pop() {
        path.removeLast()
    }
    
    func push(page:HomeNavigation) {
        path.append(page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page : HomeNavigation) -> some View {
        switch page {
        case .homeScreen:
            HomeFactory(homeCoordinator: self).getHomeView()
        case .mediaDetails(let id,let mediaType):
            MediaDetailsCoordinatorView(coordinator: MediaDetailsCoordinator(parentCoordinator: self, mediaID: id, mediaType: mediaType))
        }
    }
    
}
