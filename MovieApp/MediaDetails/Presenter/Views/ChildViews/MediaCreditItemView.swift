//
//  MediaCreditItemView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI
import Kingfisher

struct MediaCreditItemView: View {
    
    var viewModel: MediaCreditItemViewModel
    
    var body: some View {
        VStack(alignment:.center) {
            getImageView()
            getTitleView()
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
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .clipShape(Circle())
        } else {
            Image("noProfileImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height: 100)
                .clipShape(Circle())
        }
    }
    
    private func getTitleView() -> some View {
        return Text(viewModel.title)
            .lineLimit(2)
            .foregroundStyle(.white)
            .font(.subheadline)
    }
    
}




