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
        .onAppear {
            viewModel.LoadWatchListMovies()
            viewModel.LoadWatchListTVShows()
        }
    }
}

//#Preview {
//    WatchListView()
//}
