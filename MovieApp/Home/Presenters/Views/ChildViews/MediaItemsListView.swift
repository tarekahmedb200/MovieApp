//
//  MediaItemsListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import SwiftUI

struct MediaItemsListView: View {
    
    var viewModel: MediaItemsListViewModel
    var completion: ((MediaItemViewModel) -> Void)
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(alignment:.top) {
                ForEach(viewModel.mediaItemRowStyleViewModels) { mediaItemsViewModel in
                    MediaItemView(viewModel: mediaItemsViewModel)
                        .frame(width: 150,height: 300,alignment: .top)
                        .onTapGesture {
                            completion(mediaItemsViewModel)
                        }
                }
            }
        }
    }
}

