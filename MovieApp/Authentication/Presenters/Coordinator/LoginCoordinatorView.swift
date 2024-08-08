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
            Color("AppBackgroundColor", bundle: nil)
                .ignoresSafeArea()
            
            coordinator.build(page: .loginScreen)
                .fullScreenCover(item: $coordinator.fullScreenCover) { _ in
                    coordinator.build(page: .homeScreen)
                }
        }
        
    }
    
}
