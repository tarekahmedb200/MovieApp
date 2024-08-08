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
        
        ZStack {
            
            Color(red: 31.0/255, green: 32.0/255, blue: 90.0/255,opacity: 1)
            
            HStack(alignment: .center) {
                
                VStack(alignment:.leading,spacing: 5) {
                    Text(viewModel.title)
                        .lineLimit(2)
                        .multilineTextAlignment(.leading)
                        .font(.headline)
                    
                    Text(viewModel.genre)
                        .font(.subheadline)
                    
                }
                
                
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
            .foregroundStyle(.white)
            .padding()
            
        }
    }
}

//#Preview {
//    GenreContentItemView()
//}
