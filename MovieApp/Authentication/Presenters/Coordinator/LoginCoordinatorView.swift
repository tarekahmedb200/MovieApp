//
//  LoginCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation
import SwiftUI

struct LoginCoordinatorView : View {
    
    @StateObject var coordinator = LoginCoordinator()
    
    var body: some View {
        coordinator.LoginView
            .fullScreenCover(item: $coordinator.fullScreenCover) { _ in
                HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
            }
    }
    
}
