//
//  GenreContentContainerListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct GenreContentContainerListView: View {
    
    @StateObject var viewModel: GenreContentContainerListViewModel
    
    var body: some View {
        
        ScrollView {
            MediaItemsListRowStyleView(viewModel: MediaItemsListViewModel(mediaItems: viewModel.mediaItemDtos), showMore: viewModel.showMore) { mediaItemsListRowStyleViewModel in
                viewModel.navigateToMediaDetails(id: mediaItemsListRowStyleViewModel.id)
            } paginationCompletion: {
                viewModel.handlePagination()
            }
            .navigationTitle(viewModel.genreName)
        }
    }
}

//#Preview {
//    GenreContentContainerListView()
//}
