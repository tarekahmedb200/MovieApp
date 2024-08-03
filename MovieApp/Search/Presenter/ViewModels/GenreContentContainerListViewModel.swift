//
//  GenreContentContainerListViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

class GenreContentContainerListViewModel: ObservableObject {
    
    @Published var mediaItemDtos : [MediaItemDTO] = []
    
    private var mediaType: MediaTypeDTO
    private var genreID: Int64
    private var page: Int = 1
    
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    
    private var movieGenreContentListUseCase : MovieGenreContentListUseCase
    private var tvShowGenreContentListUseCase : TVShowGenreContentListUseCase
    
    init(mediaType: MediaTypeDTO, genreID: Int64,movieGenreContentListUseCase: MovieGenreContentListUseCase, tvShowGenreContentListUseCase: TVShowGenreContentListUseCase) {
        self.mediaType = mediaType
        self.genreID = genreID
        self.movieGenreContentListUseCase = movieGenreContentListUseCase
        self.tvShowGenreContentListUseCase = tvShowGenreContentListUseCase
        
        if self.mediaType == .movie {
            LoadMovieGenreContentList()
        }else {
            LoadTVShowGenreContentList()
        }
        
    }
    
    func LoadMovieGenreContentList() {
        self.movieGenreContentListUseCase.execute(genreID:self.genreID) { result in
            switch result {
            case .success(let movieItemDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.mediaItemDtos = movieItemDtos
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadTVShowGenreContentList() {
        self.tvShowGenreContentListUseCase.execute(genreID:self.genreID) { result in
            switch result {
            case .success(let tvItemsDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.mediaItemDtos = tvItemsDtos
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    
    //    func navigateToMediaDetails(id:Int64,mediaType:MediaTypeDTO) {
    //        mediaListCoordinator.push(page: .mediaDetails(id: id, mediaType: mediaType))
    //    }
}
