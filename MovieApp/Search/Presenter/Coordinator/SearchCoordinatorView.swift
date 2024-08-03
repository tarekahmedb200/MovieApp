//
//  SearchCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct SearchCoordinatorView: View {
    
    @ObservedObject var coordinator: SearchCoordinator
    
    var body: some View {
        NavigationStack(path:$coordinator.path){
            coordinator.build(page: .genreList)
                .navigationDestination(for: SearchCoordinator.SearchNavigation.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
}


