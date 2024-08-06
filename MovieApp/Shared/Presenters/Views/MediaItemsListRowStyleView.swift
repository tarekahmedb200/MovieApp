//
//  MediaItemsListRowStyleView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct MediaItemsListRowStyleView: View {
    
    var viewModel: MediaItemsListRowStyleViewModel
    var showMore : Bool
    var clickCompletion : ((MediaItemRowStyleViewModel) -> Void)
    var paginationCompletion : (() -> Void)
    
    var columns: [GridItem] =
    Array(repeating: GridItem(.flexible(minimum: 100, maximum: 100)), count: 1)
    
    var body: some View {
            LazyVGrid(columns: columns,alignment: .center) {
                ForEach(viewModel.mediaItemRowStyleViewModels) { mediaItemRowStyleViewModel in
                    MediaItemRowStyleView(viewModel:mediaItemRowStyleViewModel)
                        .onTapGesture {
                            clickCompletion(mediaItemRowStyleViewModel)
                        }
                }
                
                if showMore {
                    ProgressView()
                        .onAppear {
                            paginationCompletion()
                        }
                }
            }
    }
}

//#Preview {
//    GenreContentListView()
//}
