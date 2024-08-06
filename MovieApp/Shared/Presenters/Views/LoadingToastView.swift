//
//  LoadingToastView.swift
//  MovieApp
//
//  Created by tarek ahmed on 06/08/2024.
//

import SwiftUI

struct LoadingToastView: View {
    @State private var isAnimating = false
    
    var body: some View {
        
        ZStack {
            
            Color(red: 31.0/255, green: 32.0/255, blue: 90.0/255,opacity: 1)
            
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(lineWidth: 5)
                .fill(LinearGradient(colors: [.red,.purple], startPoint: .top, endPoint: .bottom))
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
                .overlay(content: {
                    Text("Loading")
                        .foregroundStyle(.white)
                        .font(.caption)
                })
                .frame(width: 70,height: 70)
                .padding()
                .onAppear {
                    isAnimating = true
                }
        }
       
        
    }
}

#Preview {
    LoadingToastView()
}
