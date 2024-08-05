//
//  HomeCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation
import SwiftUI

struct HomeCoordinatorView: View {

    @ObservedObject var coordinator: HomeCoordinator

    var body: some View {
        TabView(selection: $coordinator.tab) {
            MediaListCoordinatorView(coordinator: coordinator.mediaListCoordinator)
                .tabItem { Label("Media List", systemImage: "list.bullet") }
                .tag(HomeTab.mediaList)
            
            SearchCoordinatorView(coordinator: coordinator.searchCoordinator)
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
                .tag(HomeTab.search)
            

            ProfileCoordinatorView(coordinator: coordinator.profileCoordinator)
                .tabItem { Label("Profile", systemImage: "person.circle") }
                .tag(HomeTab.profile)            
        }
    }

}
