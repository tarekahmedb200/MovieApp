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
        NavigationStack(path:$coordinator.path){
            coordinator.build(page: .mediaList)
                .navigationDestination(for: MediaListCoordinator.MediaListNavigation.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}

