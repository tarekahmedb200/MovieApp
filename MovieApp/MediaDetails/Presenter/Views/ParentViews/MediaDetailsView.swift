//
//  MediaDetailsView.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation
import SwiftUI
import Kingfisher


struct MediaDetailsView: View {
    
    @StateObject var viewModel: MediaDetailsViewModel
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            posterView
            infoView
            subInfoView
            creditView
        }
    }
    
    
    @ViewBuilder
    var posterView : some View {
        GeometryReader { geometry in
            if let posterImagePathUrl = viewModel.posterPathUrl {
                KFImage.url(posterImagePathUrl)
                    .placeholder{
                        ProgressView()
                    }
                    .resizable()
                    .frame(width: geometry.size.width,
                           height: geometry.height)
                    .offset(y: geometry.verticalOffset)
            }
        }
        .frame(height: 300)
    }
    
    @ViewBuilder
    var infoView: some View {
        
        HStack {
            
            VStack(alignment:.leading,spacing:10) {
                Text(viewModel.title)
                    .font(.title3)
                    .fontDesign(.rounded)
                    .bold()
                
                HStack(alignment:.top,spacing: 10) {
                    
                    Text(viewModel.durationText)
                    
                    HStack(spacing:0) {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                        Text(viewModel.ratingText)
                    }
                    
                    Text(viewModel.mediaDate)
                }
                .font(.caption)
            }
            
            Spacer()
            
            Button {
                viewModel.addMediaToWatchlist()
            } label: {
                Image(systemName: viewModel.isAddedToWatchList ? "checkmark" : "plus")
                    .font(.headline)
                    .frame(width: 50,height: 50)
                    .background(.red)
                    .clipShape(Circle())
                    .animation(.bouncy,value: viewModel.isAddedToWatchList)
            }
        }
        .padding()
        .foregroundStyle(.white)
    }
    
    @ViewBuilder
    var subInfoView : some View {
        VStack(alignment:.leading,spacing: 10) {
            Text("Description :")
                .font(.title3)
                .frame(alignment: .leading)
            
            Text(viewModel.overview)
                .font(.headline)
        }
        .padding()
        .foregroundStyle(.white)
    }
    
    @ViewBuilder
    var creditView : some View {
        
        VStack(alignment: .leading,spacing: 10) {
            Text("Cast & Crew")
                .font(.title3)
                .frame(alignment: .leading)
                .foregroundStyle(.white)
            
            MediaCreditsListView(viewModel: MediaCreditListViewModel(mediaCredits: viewModel.mediaCredits))
        }
        .padding()
        
    }
    
    
}
