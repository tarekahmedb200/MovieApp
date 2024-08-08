//
//  ProfileView.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @StateObject var viewModel : ProfileViewModel
    
    var body: some View {
        
        ScrollView {
            
            profileView
            
            VStack(alignment: .leading,spacing:10) {
                Button(action: {
                    viewModel.navigateToWatchList()
                }, label: {
                    Text("WatchList")
                        .font(.headline)
                })
                
                Divider()
                    .background(.white)
                    .frame(height: 5)
            }
            .padding()
            
            Button(action: {
                viewModel.logout()
            }, label: {
                Text("Logout")
            })
            .frame(width: 200,height: 50)
            .background(.red)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            .padding()
            
        }
        .scrollContentBackground(.hidden)
        .background(
            Color(red: 21.0/255, green: 26.0/255, blue: 48.0/255,opacity: 1)
                .ignoresSafeArea()
        )
        .foregroundStyle(.white)
        .onAppear {
            viewModel.LoadProfileDetails()
        }
    }
    
    @ViewBuilder
    var profileView : some View {
        
        VStack(alignment:.center) {
            if let thumb = viewModel.posterPathUrl {
                KFImage.url(thumb)
                    .placeholder{
                        ProgressView()
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(
                        Circle()
                    )
                    .frame(width: 200,height:200)
                
            } else {
                Image("noMediaImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(
                        Circle()
                    )
                    .frame(width: 70,height:70)
                
            }
            
            Text(viewModel.profileUserName)
                .font(.title3)
                .bold()
        }
        .foregroundStyle(.white)
    }
    
}

//#Preview {
//    ProfileView()
//}
