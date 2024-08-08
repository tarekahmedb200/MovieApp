//
//  HomeFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation

class HomeFactory {
    
    private var homeCoordinator : HomeCoordinator
    
    init(homeCoordinator: HomeCoordinator) {
        self.homeCoordinator = homeCoordinator
    }
    
    func getHomeView() -> HomeView {
        return HomeView(viewModel: self.getHomeViewModel())
    }
    
    private func getHomeViewModel() -> HomeViewModel {
        return HomeViewModel(
            topRatedMovieUseCase: getTopRatedMovieUseCase(),
            topRatedTVShowUseCase: getTopRatedTVShowUseCase(),
            upComingMovieUseCase: getUpComingMovieUseCase(),
            upComingTVShowUseCase: getUpComingTVShowsUseCase(),
            homeCoordinator: self.homeCoordinator)
    }
    
    private func getTopRatedTVShowUseCase() -> TopRatedTVShowUseCase {
        return TopRatedTVShowUseCaseImplementation(mediaListRepository: getMediaListRepository())
    }
    
    private func getTopRatedMovieUseCase() -> TopRatedMovieUseCase {
        return TopRatedMovieUseCaseImplementation(mediaListRepository: getMediaListRepository())
    }
    
    
    private func getUpComingMovieUseCase() -> UpComingMoviesUseCase {
        return UpComingMovieUseCaseImplementation(mediaListRepository: getMediaListRepository())
    }
    
    private func getUpComingTVShowsUseCase() -> UpComingTVShowsUseCase {
        return UpComingTVShowUseCaseImplementation(mediaListRepository: getMediaListRepository())
    }
    
    private func getMediaListRepository() -> MediaListRepository {
      return MediaListRepositoryImplementation(mediaListService: MediaListServiceImplementation())
    }
    
}
