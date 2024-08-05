//
//  ProfileCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation
import SwiftUI

struct ProfileCoordinatorView : View {
    
    @StateObject var coordinator : ProfileCoordinator
    
    var body: some View {
        NavigationStack(path:$coordinator.path){
            coordinator.build(page: .profileScreen)
                .navigationDestination(for: ProfileCoordinator.ProfileScreenNavigation.self) { page in
                    coordinator.build(page: page)
                }
        }
    }
    
}
