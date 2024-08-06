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
        ZStack {
            Color(red: 21.0/255, green: 26.0/255, blue: 48.0/255,opacity: 1)
                .ignoresSafeArea()
            
            coordinator.build(page: .mediaDetails)
        }
    }
}

