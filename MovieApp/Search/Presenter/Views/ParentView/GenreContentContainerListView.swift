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
            MediaItemsListRowStyleView(viewModel: MediaItemsListRowStyleViewModel(mediaItems: viewModel.mediaItemDtos), showMore: viewModel.showMore) { mediaItemsListRowStyleViewModel in
                viewModel.navigateToMediaDetails(id: mediaItemsListRowStyleViewModel.id)
            } paginationCompletion: {
                viewModel.handlePagination()
            }
        }
    }
}

//#Preview {
//    GenreContentContainerListView()
//}
