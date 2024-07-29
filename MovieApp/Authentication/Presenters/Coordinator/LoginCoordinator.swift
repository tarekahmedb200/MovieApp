//
//  LoginCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation


class LoginCoordinator: ObservableObject {
     
    enum FullScreenCover : String , Identifiable {
        case homeScreen
        
        var id : String {
            self.rawValue
        }
    }
    
    @Published var fullScreenCover: FullScreenCover?
    
    private lazy var loginFactory: LoginViewFactory = {
            LoginViewFactory(loginCoordinator: self)
    }()
    
    func present(fullScreenCover : FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func dimissFullScreenCover() {
        self.fullScreenCover = nil
    }
    
    func getLoginView() -> LoginView {
        return loginFactory.getLoginView()
    }
    
}
