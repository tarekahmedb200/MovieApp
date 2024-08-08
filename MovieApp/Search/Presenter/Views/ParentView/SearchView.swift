//
//  SearchView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SearchViewModel
    
    var body: some View {
        
        ScrollView {
            
            if !viewModel.isSearching {
                GenreListView(viewModel: MediaGenreListViewModel(mediaGenreItems: viewModel.movieGenreDtos),
                              sectionTitle: "Movie Genre")
                { movieGenreItemViewModel in
                    viewModel.navigateToGenreContentList(id: movieGenreItemViewModel.id, mediaType: .movie, genreName: movieGenreItemViewModel.title)
                }
                
                GenreListView(viewModel: MediaGenreListViewModel(mediaGenreItems: viewModel.tvGenresDtos),
                              sectionTitle: "TV Shows Genre")
                { tvGenreItemViewModel in
                    viewModel.navigateToGenreContentList(id: tvGenreItemViewModel.id, mediaType: .tv, genreName: tvGenreItemViewModel.title)
                }
            } else {
                
                Picker("Movie Type", selection: $viewModel.mediaType) {
                    ForEach(MediaTypeDTO.allCases) { type in
                        Text(type.rawValue)
                            .tint(.white)
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                
                switch viewModel.mediaType {
                case .movie:
                    
                    MediaItemsListRowStyleView(viewModel: MediaItemsListRowStyleViewModel(mediaItems: viewModel.searchedMovieItems), showMore: viewModel.showMoreSearchedMovies) { mediaItemsListRowStyleViewModel in
                        viewModel.navigateToMediaDetails(id:mediaItemsListRowStyleViewModel.id , mediaType: .movie)
                    } paginationCompletion: {
                        viewModel.handlePagination()
                    }

                case .tv:
                    MediaItemsListRowStyleView(viewModel: MediaItemsListRowStyleViewModel(mediaItems: viewModel.searchedTVShowItems), showMore: viewModel.showMoreSearchedTVShow) { mediaItemsListRowStyleViewModel in
                        viewModel.navigateToMediaDetails(id:mediaItemsListRowStyleViewModel.id , mediaType: .tv)
                    } paginationCompletion: {
                        viewModel.handlePagination()
                    }
                }
            }
        }
        .scrollDismissesKeyboard(.immediately)
        .searchable(text: $viewModel.searchText,prompt: "Search..")
        .navigationTitle("Search...")
        .navigationBarTitleDisplayMode(.large)
    }
    
    
}

//#Preview {
//    SearchView()
//}
 
