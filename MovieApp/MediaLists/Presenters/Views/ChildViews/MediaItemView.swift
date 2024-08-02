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
                    .frame(width: 200,height: 150)
                    .background(.black.opacity(0.4))
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
            
            VStack(alignment:.leading,spacing: 5) {
                Text(viewModel.title)
                Text(viewModel.genre)
            }
            .lineLimit(2)
            .foregroundStyle(.black)
            .font(.subheadline)
            
        }
    }
}

//#Preview {
//    MediaItemView(viewModel: MediaItemViewModel(mediaItemDTO: MediaItemDTO(id: 12,title: "The Shawshank Redemption", genres: [18,80], posterPath: "/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg")))
//}
