//
//  MediaCreditsListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct MediaCreditsListView: View {
    
    var viewModel: MediaCreditListViewModel
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment:.top) {
                ForEach(viewModel.mediaCreditsItemViewModels) { mediaItemsViewModel in
                    MediaCreditItemView(viewModel: mediaItemsViewModel)
                        .frame(width: 150)
                }
            }
        }
    }
}




