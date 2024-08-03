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
        MediaItemsListRowStyleView(viewModel: MediaItemsListRowStyleViewModel(mediaItems: viewModel.mediaItemDtos)) { mediaItemsListRowStyleViewModel in
            print(mediaItemsListRowStyleViewModel.title)
        } paginationCompletion: {
            
        }
    }
}

//#Preview {
//    GenreContentContainerListView()
//}
