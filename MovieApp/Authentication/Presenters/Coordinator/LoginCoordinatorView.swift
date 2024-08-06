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
        
        ZStack {
            Color(red: 21.0/255, green: 26.0/255, blue: 48.0/255,opacity: 1)
                .ignoresSafeArea()
            
            coordinator.LoginView
                .fullScreenCover(item: $coordinator.fullScreenCover) { _ in
                    HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
                }
        }
        
    }
    
}
