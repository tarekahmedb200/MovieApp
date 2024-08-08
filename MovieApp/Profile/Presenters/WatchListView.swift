//
//  WatchListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import SwiftUI

struct WatchListView: View {
    
    @StateObject var viewModel: WatchListViewModel
    
    var body: some View {
        
        ScrollView {
            
            Picker("Movie Type", selection: $viewModel.mediaType) {
                ForEach(MediaTypeDTO.allCases) { type in
                    Text(type.rawValue)
                        .tag(type)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            switch viewModel.mediaType {
            case .movie:
                
                MediaItemsListRowStyleView(viewModel: MediaItemsListRowStyleViewModel(mediaItems: viewModel.watchListMovies), showMore: viewModel.showMoreWatchListMovies) { mediaItemsListRowStyleViewModel in
                    viewModel.navigateToMediaDetails(id:mediaItemsListRowStyleViewModel.id , mediaType: .movie)
                } paginationCompletion: {
                    viewModel.handlePagination()
                }
                
            case .tv:
                MediaItemsListRowStyleView(viewModel: MediaItemsListRowStyleViewModel(mediaItems: viewModel.watchListTVShows), showMore: viewModel.showMoreWatchListTVShows) { mediaItemsListRowStyleViewModel in
                    viewModel.navigateToMediaDetails(id:mediaItemsListRowStyleViewModel.id , mediaType: .tv)
                } paginationCompletion: {
                    viewModel.handlePagination()
                }
            }
        }
        .background(
            Color(red: 21.0/255, green: 26.0/255, blue: 48.0/255,opacity: 1)
                .ignoresSafeArea()
        )
        .navigationTitle("Watch List")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.LoadWatchListMovies()
            viewModel.LoadWatchListTVShows()
        }
    }
}

//#Preview {
//    WatchListView()
//}
