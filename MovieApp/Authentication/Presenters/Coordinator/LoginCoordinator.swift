//
//  LoginCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation
import SwiftUI

class LoginCoordinator: ObservableObject {
    
    enum LoginNavigation : String , Identifiable {
        case loginScreen
        case homeScreen
        
        var id : String {
            self.rawValue
        }
    }
    
    lazy var homeCoordinator: HomeCoordinator = {
        HomeCoordinator(parentCoordinator: self)
    }()
    
    @Published var fullScreenCover: LoginNavigation?
    
    func present(fullScreenCover : LoginNavigation) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dimissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page : LoginNavigation) -> some View {
        switch page {
        case .loginScreen:
            LoginViewFactory(loginCoordinator: self).getLoginView()
        case .homeScreen:
            HomeCoordinatorView(coordinator: self.homeCoordinator)
        }
    }
    
}
