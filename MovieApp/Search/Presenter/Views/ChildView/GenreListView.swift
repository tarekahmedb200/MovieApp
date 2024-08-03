//
//  GenreListView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

struct GenreListView: View {
    
    var viewModel: MediaGenreListViewModel
    var sectionTitle : String
    var completion : ((MediaGenreItemViewModel) -> Void)
    
    var columns: [GridItem] =
    Array(repeating: GridItem(.flexible(minimum: UIScreen.main.bounds.width / 2, maximum: UIScreen.main.bounds.width / 2)), count: 2)
    
    var body: some View {
        Section(sectionTitle) {
            LazyVGrid(columns: columns,alignment: .center) {
                ForEach(viewModel.mediaItemsViewModels) { mediaGenreItemViewModel in
                    GenreItemView(viewModel: mediaGenreItemViewModel)
                        .frame(width: 150 ,height: 150)
                        .onTapGesture {
                            completion(mediaGenreItemViewModel)
                        }
                }
            }
        }
    }
}

//#Preview {
//    GenreListView()
//}
