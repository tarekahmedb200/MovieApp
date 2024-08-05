//
//  WatchListViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

class WatchListViewModel: ObservableObject {
    
    @Published var watchListMovies : [MediaItemDTO] = []
    @Published var watchListTVShows : [MediaItemDTO] = []
    @Published var mediaType : MediaTypeDTO = .movie

    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    
    private var watchListMoviesUseCase : WatchListMoviesUseCase
    private var watchListTVShowsUseCase : WatchListTVShowsUseCase
    private var profileCoordinator : ProfileCoordinator
    
    init(watchListMoviesUseCase: WatchListMoviesUseCase, watchListTVShowsUseCase: WatchListTVShowsUseCase, profileCoordinator: ProfileCoordinator) {
        self.watchListMoviesUseCase = watchListMoviesUseCase
        self.watchListTVShowsUseCase = watchListTVShowsUseCase
        self.profileCoordinator = profileCoordinator
        LoadWatchListMovies()
        LoadWatchListTVShows()
    }
    
    func LoadWatchListMovies() {
        self.watchListMoviesUseCase.execute { result in
            switch result {
            case .success(let watchListMovies):
                DispatchQueue.main.async { [weak self] in
                    self?.watchListMovies = watchListMovies
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func LoadWatchListTVShows() {
        self.watchListTVShowsUseCase.execute { result in
            switch result {
            case .success(let watchListTVShows):
                DispatchQueue.main.async { [weak self] in
                    self?.watchListTVShows = watchListTVShows
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func navigateToMediaDetails(id:Int64,mediaType:MediaTypeDTO) {
        profileCoordinator.push(page: .mediaDetails(id: id, mediaType: mediaType))
    }
    
}
