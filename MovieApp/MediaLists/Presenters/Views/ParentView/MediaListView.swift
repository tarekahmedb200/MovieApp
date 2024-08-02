//
//  MediaListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import SwiftUI

struct MediaListView: View {
    
    @StateObject var viewModel: MediaListViewModel
    
    var body: some View {
        ScrollView {
            Section("Top Rated Movies") {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.topRatedMovies)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .movie)
                }
            }
            
            Section("Top Rated TV Shows") {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.topRatedTVShows)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .tv)
                }
            }
            
            Section("UPComing Movies") {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.upComingMovies)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .movie)
                }
            }
            
            Section("UPComing TV Shows") {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.upComingTVShows)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .movie)
                }
            }
        }
        .padding(.horizontal)
        .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

