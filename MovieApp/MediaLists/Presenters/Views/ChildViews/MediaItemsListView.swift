//
//  MediaItemsListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import SwiftUI

struct MediaItemsListView: View {
    
    var viewModel: MediaItemsListViewModel
    var completion : ((MediaItemViewModel) -> Void)
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(alignment:.top) {
                ForEach(viewModel.mediaItemsViewModels) { mediaItemsViewModel in
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

//#Preview {
//    MediaItemsListView(viewModel: MediaItemsListViewModel(mediaItems: [
//        MediaItemDTO(id: 12,title: "The Shawshank Redemption", genres: [18,80], posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg"),
//        MediaItemDTO(id: 14,title: "The Godfather", genres: [18,80], posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg"),
//        MediaItemDTO(id: 16,title: "The Shawshank Redemption", genres: [18,80], posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg"),
//        MediaItemDTO(id: 17,title: "The Godfather", genres: [18,80], posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg")
//    ])
//    )
//}
