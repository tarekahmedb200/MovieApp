//
//  HomeCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import SwiftUI

struct HomeCoordinatorView: View {
    
    @ObservedObject var coordinator: HomeCoordinator
    
    var body: some View {
        NavigationStack(path:$coordinator.path) {
            ZStack {
                
                Color("AppBackgroundColor", bundle: nil)
                    .ignoresSafeArea()
                
                coordinator.build(page: .homeScreen)
                    .navigationDestination(for: HomeCoordinator.HomeNavigation.self) { page in
                        coordinator.build(page: page)
                    }
            }
        }
    }
}

