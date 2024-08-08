//
//  GenreItemView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI
import Kingfisher

struct GenreItemView: View {
    
    var viewModel: MediaGenreItemViewModel
    
    var body: some View {
        
        RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
            .fill (
                LinearGradient(
                    gradient: Gradient(colors: [Color(hex: viewModel.gridentColor.startColor), Color(hex: viewModel.gridentColor.endColor)]),
                    startPoint: .topLeading,
                    endPoint: .bottomLeading
                )
            )
            .overlay {
                
                VStack {
                    Image(viewModel.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50,height: 50)
                        .foregroundStyle(.white)
                    
                    Text(viewModel.title)
                        .lineLimit(2)
                        .foregroundStyle(.white)
                        .font(.title2)
                        .fontDesign(.serif)
                }
            }
    }
}

#Preview {
    GenreItemView(viewModel: MediaGenreItemViewModel(mediaGenreDTO: MediaGenreDTO(id: 18, name: "Action")))
        .previewLayout(.sizeThatFits)
}
