//
//  MediaDetailsCoordinatorView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct MediaDetailsCoordinatorView: View {
    
    @ObservedObject var coordinator: MediaDetailsCoordinator
     
    var body: some View {
        coordinator.build(page: .mediaDetails)
    }
}

