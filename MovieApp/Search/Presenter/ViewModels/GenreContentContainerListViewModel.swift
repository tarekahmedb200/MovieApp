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
    @Published var showMore : Bool = false
    
    private var movieGenreContentListUseCase : MovieGenreContentListUseCase
    private var tvShowGenreContentListUseCase : TVShowGenreContentListUseCase
    private var searchCoordinator : SearchCoordinator
    
    init(mediaType: MediaTypeDTO, genreID: Int64,searchCoordinator:SearchCoordinator,movieGenreContentListUseCase: MovieGenreContentListUseCase, tvShowGenreContentListUseCase: TVShowGenreContentListUseCase) {
        self.mediaType = mediaType
        self.genreID = genreID
        self.movieGenreContentListUseCase = movieGenreContentListUseCase
        self.tvShowGenreContentListUseCase = tvShowGenreContentListUseCase
        self.searchCoordinator = searchCoordinator
        
        if self.mediaType == .movie {
            LoadMovieGenreContentList()
        }else {
            LoadTVShowGenreContentList()
        }
        
    }
    
    func handlePagination() {
        page += 1
        
        print("page -->")
        print(page)
        
        if mediaType == .movie {
            LoadMovieGenreContentList()
        }else {
            LoadTVShowGenreContentList()
        }
    }
    
    func LoadMovieGenreContentList() {
        self.movieGenreContentListUseCase.execute(page: page, genreID: genreID) { result in
            switch result {
            case .success(let movieItemDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.mediaItemDtos += movieItemDtos
                    self?.showMore = movieItemDtos.count > 0
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage += error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadTVShowGenreContentList() {
        self.tvShowGenreContentListUseCase.execute(page: page, genreID: genreID) { result in
            switch result {
            case .success(let tvItemsDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.mediaItemDtos += tvItemsDtos
                    self?.showMore = tvItemsDtos.count > 0
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func navigateToMediaDetails(id:Int64) {
        searchCoordinator.push(page: .mediaDetails(id: id, mediaType: self.mediaType))
    }
}
