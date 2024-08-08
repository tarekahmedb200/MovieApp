//
//  MediaDetailsFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation


class MediaDetailsFactory {
    
    private var mediaDetailsCoordinator: MediaDetailsCoordinator
    private var mediaType: MediaTypeDTO
    private var mediaID: Int64
    
    init(mediaID: Int64,mediaType:MediaTypeDTO, mediaDetailsCoordinator : MediaDetailsCoordinator) {
        self.mediaDetailsCoordinator = mediaDetailsCoordinator
        self.mediaType = mediaType
        self.mediaID = mediaID
    }
    
    func getMediaDetailsView() -> MediaDetailsView {
        return MediaDetailsView(viewModel: self.getMediaDetailsViewModel())
    }
    
    private func getMediaDetailsViewModel() -> MediaDetailsViewModel {
        
        return MediaDetailsViewModel(mediaType: self.mediaType, mediaID: self.mediaID, movieDetailsUseCase: getMovieDetailsUseCase(), tvShowDetailsUseCase: getTVShowDetailsUseCase(),
                                     movieCreditUseCase: getMovieCreditsUseCase(),
                                     tvShowCreditUseCase: getTVShowCreditsUseCase(),
                                     addMovieToWatchlistUseCase: getAddMovieToWatchlistUseCase(), addTVShowToWatchlistUseCase: getAddTVShowToWatchlistUseCase(), watchListMoviesUseCase: getWatchListMoviesUseCase(), watchListTVShowsUseCase: getWatchListTVShowsUseCase(),
                                     mediaDetailsCoordinator: self.mediaDetailsCoordinator)
    }
    
    
    private func getTVShowCreditsUseCase() -> TVShowCreditUseCase {
        return TVShowCreditUseCaseImplementation(mediaDetailsRepository: getMediaDetailsRepository())
    }
    private func getMovieCreditsUseCase() -> MovieCreditsUseCase {
        return MovieCreditUseCaseImplementation(mediaDetailsRepository: getMediaDetailsRepository())
    }
    
    private func getTVShowDetailsUseCase() -> TVShowDetailsUseCase {
        return TVShowDetailsUseCaseImplementation(mediaDetailsRepository: getMediaDetailsRepository())
    }
    
    private func getMovieDetailsUseCase() -> MovieDetailsUseCase {
        return MovieDetailsUseCaseImplementation(mediaDetailsRepository: getMediaDetailsRepository())
    }
    
    private func getMediaDetailsRepository() -> MediaDetailsRepository {
        return MediaDetailsRepositoryImplementation(mediaDetailsService: MediaDetailsServiceImplementation())
    }
    
    private func getAddMovieToWatchlistUseCase() -> AddMovieToWatchlistUseCase {
        return AddMovieToWatchListUseCaseImplementation(mediaWatchListRepository: getMediaWatchListRepository())
    }
    
    private func getAddTVShowToWatchlistUseCase() -> AddTVShowToWatchlistUseCase {
        return AddTVShowToWatchListUseCaseImplementation(mediaWatchListRepository: getMediaWatchListRepository())
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
