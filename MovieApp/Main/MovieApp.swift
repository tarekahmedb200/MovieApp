//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import SwiftUI

@main
struct MovieApp: App {
    
    init() {
        changeNavbarAppearance()
        changeSegmentControlAppearance()
        changeTabbarAppearance()
    }
    
    private func changeNavbarAppearance() {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = UIColor(red: 31.0/255, green: 32.0/255, blue: 90.0/255,alpha: 1)
        
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        
        UISearchBar.appearance().overrideUserInterfaceStyle = .dark
    }
    
    private func changeSegmentControlAppearance() {
        let colorAppearance = UISegmentedControl.appearance()
        colorAppearance.backgroundColor = UIColor(red: 31.0/255, green: 32.0/255, blue: 90.0/255,alpha: 1)
        colorAppearance.selectedSegmentTintColor = .blue
        colorAppearance.tintColor = .white
        colorAppearance.setTitleTextAttributes([.foregroundColor : UIColor.white], for: .normal)
    }
    
    private func changeTabbarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = UIColor(red: 31.0/255, green: 32.0/255, blue: 90.0/255,alpha: 1)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some Scene {
        WindowGroup {
            LoginCoordinatorView()
        }
    }
}
