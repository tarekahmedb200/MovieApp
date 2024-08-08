//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    
    @Published var movieGenreDtos : [MediaGenreDTO] = []
    @Published var tvGenresDtos : [MediaGenreDTO] = []
    
    @Published var searchedMovieItems : [MediaItemDTO] = []
    @Published var searchedTVShowItems : [MediaItemDTO] = []
    
    @Published var mediaType : MediaTypeDTO = .movie
    
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    @Published var searchText : String = ""
    @Published var isSearching : Bool = false
    @Published var showMoreSearchedMovies : Bool = false
    @Published var showMoreSearchedTVShow : Bool = false
    
    private var currentSearchText : String = ""
    private var page: Int = 1
    private var cancelable = Set<AnyCancellable>()
    
    private var searchCoordinator: SearchCoordinator
    private var movieGenresUseCase: MovieGenresUseCase
    private var tvShowGenresUseCase: TVShowGenresUseCase
    private var movieSearchUseCase: MovieSearchUseCase
    private var tvShowSearchUseCase: TVShowSearchUseCase
    
    init(searchCoordinator: SearchCoordinator,
         movieGenresUseCase: MovieGenresUseCase, tvShowGenresUseCase: TVShowGenresUseCase,
         movieSearchUseCase: MovieSearchUseCase,
         tvShowSearchUseCase: TVShowSearchUseCase
    ) {
        self.searchCoordinator = searchCoordinator
        self.movieGenresUseCase = movieGenresUseCase
        self.tvShowGenresUseCase = tvShowGenresUseCase
        self.movieSearchUseCase = movieSearchUseCase
        self.tvShowSearchUseCase = tvShowSearchUseCase
        observeSearchText()
        LoadMovieGenres()
        LoadTVShowGenres()
    }
    
    
    func observeSearchText()  {
        $searchText
            .sink { [weak self] newSearchText in
                
                guard !newSearchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                    self?.currentSearchText = ""
                    self?.searchedMovieItems = []
                    self?.searchedTVShowItems = []
                    self?.page = 1
                    self?.isSearching = false
                    return
                }
                
                if self?.currentSearchText != newSearchText {
                    self?.currentSearchText = newSearchText
                    self?.searchedMovieItems = []
                    self?.searchedTVShowItems = []
                    self?.page = 1
                    self?.isSearching = true
                    self?.LoadSearchedMovies()
                    self?.LoadSearchedTVShows()
                }
                
            }
            .store(in: &cancelable)
        
    }
    
    func handlePagination() {
        page += 1
        
        print("page -->")
        print(page)
        
        if mediaType == .movie {
            LoadSearchedMovies()
        }else {
            LoadSearchedMovies()
        }
    }
    
    func LoadMovieGenres() {
        self.movieGenresUseCase.execute { result in
            switch result {
            case .success(let movieGenresDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.movieGenreDtos = movieGenresDtos
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadTVShowGenres() {
        self.tvShowGenresUseCase.execute { result in
            switch result {
            case .success(let tvGenresDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.tvGenresDtos = tvGenresDtos
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadSearchedMovies() {
        self.movieSearchUseCase.execute(searchText:currentSearchText, page: page) { result in
            switch result {
            case .success(let movieItemDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.searchedMovieItems += movieItemDtos
                    self?.showMoreSearchedMovies = movieItemDtos.count > 0
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadSearchedTVShows() {
        self.tvShowSearchUseCase.execute(searchText:currentSearchText, page: page) { result in
            switch result {
            case .success(let tvItemDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.searchedTVShowItems += tvItemDtos
                    self?.showMoreSearchedTVShow = tvItemDtos.count > 0
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func navigateToGenreContentList(id:Int64,mediaType:MediaTypeDTO,genreName:String) {
        searchCoordinator.push(page: .genreContentList(id: id, mediaType: mediaType, genreName: genreName))
    }
    
    func navigateToMediaDetails(id:Int64,mediaType:MediaTypeDTO) {
        searchCoordinator.push(page: .mediaDetails(id: id, mediaType: mediaType))
    }
    
}

