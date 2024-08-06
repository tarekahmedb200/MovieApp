//
//  MediaItemView.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import SwiftUI
import Kingfisher

struct MediaItemView: View {
    
    var viewModel: MediaItemViewModel
    
    var body: some View {
        
        VStack(alignment:.leading) {
            
            if let posterImagePathUrl = viewModel.posterURL {
                KFImage.url(posterImagePathUrl)
                    .placeholder{
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150,height: 200)
                    .background(.blue.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
            
            VStack(alignment:.leading,spacing: 5) {
                Text(viewModel.title)
                Text(viewModel.genre)
            }
            .lineLimit(2)
            .foregroundStyle(.white)
            .fontDesign(.rounded)
            .font(.subheadline)
            
        }
    }
}

//#Preview {
//    MediaItemView(viewModel: MediaItemViewModel(mediaItemDTO: MediaItemDTO(id: 12,title: "The Shawshank Redemption", genres: [18,80], posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg")))
//}
