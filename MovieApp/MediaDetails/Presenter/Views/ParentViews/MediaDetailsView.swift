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
    
    @State var isAnimation = false
    
    @StateObject var viewModel: MediaDetailsViewModel
    
    
    var body: some View {
        
        VStack(spacing:10) {
            
            ScrollView(showsIndicators: false) {
                posterView
                infoView
                subInfoView
                creditView
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.addMediaToWatchlist()
                    } label: {
                        Image(systemName: viewModel.isAddedToWatchList ? "plus.app.fill" : "plus.app")
                    }
                }
            }
            
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
        
        VStack(alignment:.leading,spacing: 20) {
            
            VStack(alignment:.leading) {
                Text(viewModel.title)
                    .font(.title)
                    .fontDesign(.rounded)
                    .bold()
                
                Text(viewModel.genres)
                    .multilineTextAlignment(.leading)
                    .font(.body)
            }
           
            VStack(alignment:.leading) {
                Text("Description :")
                    .font(.title3)
                    .frame(alignment: .leading)
                
                Text(viewModel.overview)
                    .font(.headline)
            }
           
        }
        .padding()
        .foregroundStyle(.black)
        
    }
    
    @ViewBuilder
    var subInfoView : some View {
        
        HStack(alignment:.top,spacing: 30) {
            Group {
                
                VStack {
                    Text(viewModel.durationTitle)
                        .font(.callout)
                    
                    Text(viewModel.durationText)
                        .font(.headline)
                }
                
                VStack {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                        .font(.callout)
                    
                    Text(viewModel.ratingText)
                        .font(.headline)
                }
                
                VStack {
                    Text(viewModel.mediaDateTitle)
                        .font(.callout)
                    
                    Text(viewModel.mediaDate)
                        .font(.headline)
                }
            }
        }
    }
    
    @ViewBuilder
    var creditView : some View {
        
        VStack(alignment: .leading,spacing: 20) {
            Text("Credits:")
                .font(.title3)
                .frame(alignment: .leading)
                .foregroundStyle(.black)
            
            MediaCreditsListView(viewModel: MediaCreditListViewModel(mediaCredits: viewModel.mediaCredits))
        }
        .padding()
        
    }
    
  
}
