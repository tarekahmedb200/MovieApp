//
//  MediaListCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import SwiftUI

struct MediaListCoordinatorView: View {
    
    @ObservedObject var coordinator: MediaListCoordinator
    
    var body: some View {
        NavigationStack(path:$coordinator.path) {
            ZStack {
                Color(red: 21.0/255, green: 26.0/255, blue: 48.0/255,opacity: 1)
                    .ignoresSafeArea()
                
                coordinator.build(page: .mediaList)
                    .navigationDestination(for: MediaListCoordinator.MediaListNavigation.self) { page in
                        coordinator.build(page: page)
                    }
            }
        }
    }
}

