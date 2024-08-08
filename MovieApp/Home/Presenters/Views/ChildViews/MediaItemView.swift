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
            getImageView()
            getInfoView()
        }
    }
    
    @ViewBuilder
    private func getImageView() -> some View {
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
        } else {
            Image("noMediaImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150,height: 200)
                .clipShape(
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                )
        }
    }
    
    private func getInfoView() -> some View {
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

