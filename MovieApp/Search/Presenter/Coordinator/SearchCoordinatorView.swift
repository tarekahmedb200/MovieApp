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
            
            ZStack {
                Color(red: 21.0/255, green: 26.0/255, blue: 48.0/255,opacity: 1)
                    .ignoresSafeArea()
                
                coordinator.build(page: .genreList)
                    .navigationDestination(for: SearchCoordinator.SearchNavigation.self) { page in
                        coordinator.build(page: page)
                    }
            }
        }
    }
}


