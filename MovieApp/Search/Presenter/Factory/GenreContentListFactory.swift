//
//  GenreContentListFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

class GenreContentListFactory {
    
    private var seachCoordinator : SearchCoordinator
    private var mediaType: MediaTypeDTO
    private var genreID: Int64
   
    init(seachCoordinator: SearchCoordinator, mediaType: MediaTypeDTO, genreID: Int64) {
        self.seachCoordinator = seachCoordinator
        self.mediaType = mediaType
        self.genreID = genreID
    }
    
    func getGenreContentContainerListView() -> GenreContentContainerListView {
        return GenreContentContainerListView(viewModel: self.getGenreContentListViewModel())
    }
    
    private func getGenreContentListViewModel() -> GenreContentContainerListViewModel {
        return GenreContentContainerListViewModel(mediaType: self.mediaType, genreID: self.genreID, searchCoordinator: self.seachCoordinator, movieGenreContentListUseCase: getMovieGenreContentListUseCase(), tvShowGenreContentListUseCase: getTVShowGenreContentListUseCase())
    }
    
    private func getTVShowGenreContentListUseCase() -> TVShowGenreContentListUseCase {
        return TVShowGenreContentListUseCaseImplementation(mediaGenreContentListRepository: getMediaGenreContentlistRepository())
    }
    
    private func getMovieGenreContentListUseCase() -> MovieGenreContentListUseCase {
        return MovieGenreContentListUseCaseImplementation(mediaGenreContentListRepository: getMediaGenreContentlistRepository())
    }

    private func getMediaGenreContentlistRepository() -> MediaGenreContentListRepository {
        return  MediaGenreContentListRepositoryImplementation(mediaGenreContentListService: DefaultMediaGenreContentListServiceImplementation())
    }
    
}
