//
//  MediaItemRowStyleView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI
import Kingfisher

struct MediaItemRowStyleView: View {
    
    var viewModel: MediaItemViewModel
    
    var body: some View {
        
        HStack(alignment: .center) {
            getInfo()
            Spacer()
            getImage()
        }
        .foregroundStyle(.white)
        .padding()
        
    }
    
    private func getInfo() -> some View {
        VStack(alignment:.leading,spacing: 5) {
            Text(viewModel.title)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .font(.headline)
            
            Text(viewModel.genre)
                .font(.subheadline)
        }
    }
    
    @ViewBuilder
    private func getImage() -> some View {
        
        if let thumb = viewModel.posterURL {
            KFImage.url(thumb)
                .placeholder{
                    ProgressView()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height:150)
                .clipShape(
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                )
        } else {
            Image("noMediaImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100,height:150)
                .clipShape(
                    RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                )
        }
    }
    
}


