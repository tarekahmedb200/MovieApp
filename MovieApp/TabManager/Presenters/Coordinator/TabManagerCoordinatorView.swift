//
//  TabManagerCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation
import SwiftUI

struct TabManagerCoordinatorView: View {

    @ObservedObject var coordinator: TabManagerCoordinator

    var body: some View {
        TabView(selection: $coordinator.tab) {
            HomeCoordinatorView(coordinator: coordinator.homeCoordinator)
                .tabItem { Label("Home", systemImage: "house") }
                .tag(Tab.homeScreen)
            
            SearchCoordinatorView(coordinator: coordinator.searchCoordinator)
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
                .tag(Tab.search)
            

            ProfileCoordinatorView(coordinator: coordinator.profileCoordinator)
                .tabItem { Label("Profile", systemImage: "person.circle") }
                .tag(Tab.profile)            
        }
        .accentColor(.white)
        
    }

}
