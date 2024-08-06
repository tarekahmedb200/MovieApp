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
        
        VStack {
            List {
                
                Section("Profile") {
                    profileView
                }
                
                Section("Preferences") {
                    Button(action: {
                        viewModel.navigateToWatchList()
                    }, label: {
                        Text("WatchList")
                            .foregroundStyle(.black)
                    })
                }
                
                Button(action: {
                    viewModel.logout()
                }, label: {
                    Text("Logout")
                        .foregroundStyle(.red)
                })
                
            }
        }
        .onAppear {
            viewModel.LoadProfileDetails()
        }
    }
    
    @ViewBuilder
    var profileView : some View {
        
        HStack(alignment:.center) {
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
                    .frame(width: 70,height:70)
                
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
                .font(.body)
                .bold()
        }
    }
    
}

//#Preview {
//    ProfileView()
//}
