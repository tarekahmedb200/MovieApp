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
        
        ZStack {
            
            Color(red: 31.0/255, green: 32.0/255, blue: 90.0/255,opacity: 1)
            
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

//#Preview {
//    GenreContentListView()
//}
