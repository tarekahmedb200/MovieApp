//
//  MediaItemRowStyleView.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI
import Kingfisher

struct MediaItemRowStyleView: View {
    
    var viewModel: MediaItemRowStyleViewModel
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            VStack(alignment:.leading,spacing: 5) {
                Text(viewModel.title)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                
                Text(viewModel.genre)
                    .font(.subheadline)
                
            }
            .foregroundStyle(.black)
            
            Spacer()
            
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
        .padding()
        .frame(width: UIScreen.main.bounds.width)
        
        
    }
}

//#Preview {
//    GenreContentItemView()
//}
