//
//  HomeCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

enum HomeTab {
    case mediaList
    case search
}

class HomeCoordinator: ObservableObject {
    private var parentCoordinator : LoginCoordinator
    @Published var tab = HomeTab.mediaList
    
    lazy var mediaListCoordinator: MediaListCoordinator = {
         MediaListCoordinator(parentCoordinator: self)
    }()
    
    lazy var searchCoordinator: SearchCoordinator = {
        SearchCoordinator(parentCoordinator: self)
    }()

    
    init(parentCoordinator: LoginCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func dismiss() {
        parentCoordinator.dimissFullScreenCover()
    }
    
}

