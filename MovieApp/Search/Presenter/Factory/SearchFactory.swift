//
//  SearchFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


class SearchFactory {
    
    private var seachCoordinator : SearchCoordinator
   
    init(seachCoordinator: SearchCoordinator) {
        self.seachCoordinator = seachCoordinator
    }
    
    func getSearchView() -> SearchView {
        return SearchView(viewModel: self.getSearchViewModel())
    }
    
    private func getSearchViewModel() -> SearchViewModel {
        return SearchViewModel(searchCoordinator: seachCoordinator, movieGenresUseCase: getMovieGenresUseCase(), tvShowGenresUseCase:  getTVShowGenresUseCase(), movieSearchUseCase: getSearchedMoviesUseCase(), tvShowSearchUseCase: getSearchedTVShowUseCase())
    }
    
    private func getTVShowGenresUseCase() -> TVShowGenresUseCase {
        return TVShowGenresUseCaseImplementation(mediaGenresRepository: getMediaGenresRepository())
    }
    
    private func getMovieGenresUseCase() -> MovieGenresUseCase {
        return MovieGenresUseCaseImplementation(mediaGenresRepository: getMediaGenresRepository())
    }
    
    
    private func getSearchedMoviesUseCase() -> MovieSearchUseCase {
        return MovieSearchUseCaseImplementation(MediaSearchRepository: getMediaSearchRepository())
    }
    
    private func getSearchedTVShowUseCase() -> TVShowSearchUseCase {
        return TVShowSearchUseCaseImplementation(MediaSearchRepository:getMediaSearchRepository() )
    }
    
    private func getMediaGenresRepository() -> MediaGenresRepository {
        return  MediaGenresRepositoryImplementation(mediaGenreService: DefaultMediaGenresServiceImplementation())
    }
    
    private func getMediaSearchRepository() -> MediaSearchRepository {
        return  MediaSearchRepositoryImplemenetation(MediaSearchService: MediaSearchServiceImplementation())
    }

    
}
