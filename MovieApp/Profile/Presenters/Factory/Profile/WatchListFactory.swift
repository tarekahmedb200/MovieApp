//
//  WatchListFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

 
class WatchListFactory {
    
    private var profileCoordinator : ProfileCoordinator
    
    init(profileCoordinator: ProfileCoordinator) {
        self.profileCoordinator = profileCoordinator
    }
    
    func getWatchListView() -> WatchListView {
        return WatchListView(viewModel: self.getWatchListViewModel())
    }
    
    private func getWatchListViewModel() -> WatchListViewModel {
        return WatchListViewModel(watchListMoviesUseCase: getWatchListMoviesUseCase(), watchListTVShowsUseCase: getWatchListTVShowsUseCase(), profileCoordinator: self.profileCoordinator)
    }
    
    private func getWatchListMoviesUseCase() -> WatchListMoviesUseCase {
        return WatchListMoviesUseCaseImplementation(mediaWatchListRepository: getMediaWatchListRepository())
    }
    
    private func getWatchListTVShowsUseCase() -> WatchListTVShowsUseCase {
        return WatchListTVShowsUseCaseImplementation(mediaWatchListRepository: getMediaWatchListRepository())
    }
    
    private func getMediaWatchListRepository() -> MediaWatchListRepository {
        return MediaWatchListRepositoryImplementation(mediaWatchListService: MediaWatchListServiceImplementation())
    }
}
