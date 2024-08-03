//
//  SearchCoordinator.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation
import SwiftUI

class SearchCoordinator : ObservableObject {
    
    enum SearchNavigation : Hashable {
        case genreList
        case genreContentList(id:Int64,mediaType:MediaTypeDTO)
        case mediaDetails(id:Int64,mediaType:MediaTypeDTO)
    }
    
    private var parentCoordinator : HomeCoordinator
    
    @Published var path = NavigationPath()
    
    init(parentCoordinator: HomeCoordinator) {
        self.parentCoordinator = parentCoordinator
    }
    
    func pop() {
        path.removeLast()
    }
    
    func push(page:SearchNavigation) {
        path.append(page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    @ViewBuilder
    func build(page : SearchNavigation) -> some View {
        switch page {
        case .genreList:
            SearchFactory(seachCoordinator: self).getSearchView()
        case .genreContentList(let id, let mediaType):
            GenreContentListFactory(seachCoordinator: self, mediaType: mediaType, genreID: id).getGenreContentContainerListView()
        case .mediaDetails(let id,let mediaType):
            MediaDetailsCoordinatorView(coordinator: MediaDetailsCoordinator(mediaID: id, mediaType: mediaType))
        }
    }
    
}
