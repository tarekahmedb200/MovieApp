//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var topRatedMovies: [MediaItemDTO] = []
    @Published var topRatedTVShows: [MediaItemDTO] = []
    @Published var upComingMovies: [MediaItemDTO] = []
    @Published var upComingTVShows: [MediaItemDTO] = []
    
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    
    private var topRatedMovieUseCase: TopRatedMovieUseCase
    private var topRatedTVShowUseCase: TopRatedTVShowUseCase
    private var upComingMovieUseCase: UpComingMoviesUseCase
    private var upComingTVShowUseCase: UpComingTVShowsUseCase
    private var homeCoordinator: HomeCoordinator
    
    init(topRatedMovieUseCase: TopRatedMovieUseCase, topRatedTVShowUseCase: TopRatedTVShowUseCase,
         upComingMovieUseCase: UpComingMoviesUseCase,
         upComingTVShowUseCase: UpComingTVShowsUseCase,
         homeCoordinator : HomeCoordinator) {
        self.topRatedMovieUseCase = topRatedMovieUseCase
        self.topRatedTVShowUseCase = topRatedTVShowUseCase
        self.upComingMovieUseCase = upComingMovieUseCase
        self.upComingTVShowUseCase = upComingTVShowUseCase
        self.homeCoordinator = homeCoordinator
        LoadTopRatedMovies()
        LoadTopRatedTVShows()
        LoadUpComingMovies()
        LoadUpComingTVShows()
    }
    
    func LoadTopRatedMovies() {
        self.topRatedMovieUseCase.execute { [weak self] result in
            switch result {
            case .success(let topRatedMovies):
                DispatchQueue.main.async { [weak self] in
                    self?.topRatedMovies = topRatedMovies
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadTopRatedTVShows() {
        self.topRatedTVShowUseCase.execute { [weak self] result in
            switch result {
            case .success(let topRatedTVShows):
                DispatchQueue.main.async { [weak self] in
                    self?.topRatedTVShows = topRatedTVShows
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
                
            }
        }
    }
    
    func LoadUpComingMovies() {
        self.upComingMovieUseCase.execute { [weak self] result in
            switch result {
            case .success(let topRatedMovies):
                DispatchQueue.main.async { [weak self] in
                    self?.upComingMovies = topRatedMovies
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func LoadUpComingTVShows() {
        self.upComingTVShowUseCase.execute { [weak self] result in
            switch result {
            case .success(let topRatedTVShows):
                DispatchQueue.main.async { [weak self] in
                    self?.upComingTVShows = topRatedTVShows
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
                
            }
        }
    }
    
    func navigateToMediaDetails(id:Int64,mediaType:MediaTypeDTO) {
        homeCoordinator.push(page: .mediaDetails(id: id, mediaType: mediaType))
    }
    
}
