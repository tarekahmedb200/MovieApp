//
//  TabManagerCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

enum Tab {
    case homeScreen
    case search
    case profile
}

class TabManagerCoordinator: ObservableObject {
    private var parentCoordinator : LoginCoordinator
    @Published var tab = Tab.homeScreen
    
    lazy var homeCoordinator: HomeCoordinator = {
         HomeCoordinator(parentCoordinator: self)
    }()
    
    lazy var searchCoordinator: SearchCoordinator = {
        SearchCoordinator(parentCoordinator: self)
    }()
    
    lazy var profileCoordinator: ProfileCoordinator = {
        ProfileCoordinator(parentCoordinator: self)
    }()

    init(parentCoordinator: LoginCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func dismiss() {
        tab = .homeScreen
        parentCoordinator.dimissFullScreenCover()
    }
    
}

