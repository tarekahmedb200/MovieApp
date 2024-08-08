//
//  MediaItemsListRowStyleView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct MediaItemsListRowStyleView: View {
    
    var viewModel: MediaItemsListViewModel
    var showMore : Bool
    var clickCompletion : ((MediaItemViewModel) -> Void)
    var paginationCompletion : (() -> Void)
    
    var columns: [GridItem] =
    Array(repeating: GridItem(.flexible(minimum: 100, maximum: 100)), count: 1)
    
    var body: some View {
        
        ZStack {
            
            Color("AppBackgroundColor", bundle: nil)
            
            LazyVGrid(columns: columns,alignment: .center) {
                ForEach(viewModel.mediaItemRowStyleViewModels) { mediaItemRowStyleViewModel in
                    MediaItemRowStyleView(viewModel:mediaItemRowStyleViewModel)
                        .onTapGesture {
                            clickCompletion(mediaItemRowStyleViewModel)
                        }
                        .frame(width: UIScreen.main.bounds.width)
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
}


