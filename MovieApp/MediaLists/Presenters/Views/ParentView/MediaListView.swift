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
        ScrollView(showsIndicators: false) {
            
            Section {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.topRatedMovies)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .movie)
                }
            } header: {
                
                HStack {
                    Text("Top Rated Movies")
                        .frame(alignment: .leading)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .font(.title)
                    
                    Spacer()
                }
                
            }
            
            Section {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.topRatedTVShows)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .tv)
                }
            } header: {
                HStack {
                    Text("Top Rated TV Shows")
                        .frame(alignment: .leading)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .font(.title)
                    
                    Spacer()
                }
            }
            
            Section {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.upComingMovies)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .movie)
                }
            } header: {
                HStack {
                    Text("UPComing Movies")
                        .frame(alignment: .leading)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .font(.title)
                    
                    Spacer()
                }
            }
            
            
            Section {
                MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.upComingTVShows)) { mediaItemViewModel in
                    viewModel.navigateToMediaDetails(id: mediaItemViewModel.id, mediaType: .movie)
                }
            } header: {
                HStack {
                    Text("UPComing TV Shows")
                        .frame(alignment: .leading)
                        .foregroundStyle(.white)
                        .fontDesign(.rounded)
                        .font(.title)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

