//
//  MediaDetailsFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation


class MediaDetailsFactory {
    
    private var mediaDetailsCoordinator : MediaDetailsCoordinator
    private var mediaType: MediaTypeDTO
    private var mediaID: Int64
    
    init(mediaID: Int64,mediaType:MediaTypeDTO, mediaDetailsCoordinator : MediaDetailsCoordinator) {
        self.mediaDetailsCoordinator = mediaDetailsCoordinator
        self.mediaType = mediaType
        self.mediaID = mediaID
    }
    
    func getMediaDetailsView() -> MediaDetailsView {
        return MediaDetailsView(viewModel: self.getMediaListViewModel())
    }
    
    private func getMediaListViewModel() -> MediaDetailsViewModel {
        return MediaDetailsViewModel(mediaType: self.mediaType, mediaID: self.mediaID, movieDetailsUseCase: getMovieDetailsUseCase(), tvShowDetailsUseCase: getTVShowDetailsUseCase(),
                                     movieCreditUseCase: getMovieCreditsUseCase(),
                                     tvShowCreditUseCase: getTVShowCreditsUseCase(),
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
        return DefaultMediaDetailsRepositoryImplementation(mediaDetailsService: DefaultMediaDetailsServiceImplementation())
    }
    
}