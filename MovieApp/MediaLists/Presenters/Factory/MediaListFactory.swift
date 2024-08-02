//
//  MediaListViewFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation

class MediaListFactory {
    
    private var mediaListCoordinator : MediaListCoordinator
    
    init(mediaListCoordinator: MediaListCoordinator) {
        self.mediaListCoordinator = mediaListCoordinator
    }
    
    func getMediaListView() -> MediaListView {
        return MediaListView(viewModel: self.getMediaListViewModel())
    }
    
    private func getMediaListViewModel() -> MediaListViewModel {
        return MediaListViewModel(
            topRatedMovieUseCase: getTopRatedMovieUseCase(),
            topRatedTVShowUseCase: getTopRatedTVShowUseCase(),
            upComingMovieUseCase: getUpComingMovieUseCase(),
            upComingTVShowUseCase: getUpComingTVShowsUseCase(),
             mediaListCoordinator: self.mediaListCoordinator)
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
      return DefaultMediaListRepositoryImplementation(mediaListService: DefaultMediaListServiceImplementation())
    }
    
}
