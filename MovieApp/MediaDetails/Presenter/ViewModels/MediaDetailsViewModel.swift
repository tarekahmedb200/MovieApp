//
//  MediaDetailsViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

class MediaDetailsViewModel: ObservableObject {
    
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    @Published var isAddedToWatchList: Bool = false
    
    @Published private var movieDetailsDTo : MovieDetailsDTO?
    @Published private var tvDetailsDTo : TVShowDetailsDTO?
    @Published private var movieCreditsDTos: [MediaCreditDTO ] = []
    @Published private var tvCreditsDtos: [MediaCreditDTO ] = []
    
    
    private var mediaID: Int64
    private var mediaType : MediaTypeDTO
    private var movieDetailsUseCase : MovieDetailsUseCase
    private var tvShowDetailsUseCase : TVShowDetailsUseCase
    private var movieCreditUseCase : MovieCreditsUseCase
    private var tvShowCreditUseCase : TVShowCreditUseCase
    private var addMovieToWatchlistUseCase : AddMovieToWatchlistUseCase
    private var addTVShowToWatchlistUseCase : AddTVShowToWatchlistUseCase
    private var watchListMoviesUseCase : WatchListMoviesUseCase
    private var watchListTVShowsUseCase : WatchListTVShowsUseCase
    
    private var mediaDetailsCoordinator : MediaDetailsCoordinator
    
    init(mediaType:MediaTypeDTO,mediaID:Int64,movieDetailsUseCase: MovieDetailsUseCase, tvShowDetailsUseCase: TVShowDetailsUseCase,
         movieCreditUseCase : MovieCreditsUseCase,
         tvShowCreditUseCase : TVShowCreditUseCase,
         addMovieToWatchlistUseCase : AddMovieToWatchlistUseCase,
         addTVShowToWatchlistUseCase : AddTVShowToWatchlistUseCase,
         watchListMoviesUseCase : WatchListMoviesUseCase,
         watchListTVShowsUseCase : WatchListTVShowsUseCase,
         mediaDetailsCoordinator : MediaDetailsCoordinator) {
        self.mediaID = mediaID
        self.mediaType = mediaType
        self.movieDetailsUseCase = movieDetailsUseCase
        self.tvShowDetailsUseCase = tvShowDetailsUseCase
        self.mediaDetailsCoordinator = mediaDetailsCoordinator
        self.movieCreditUseCase = movieCreditUseCase
        self.tvShowCreditUseCase = tvShowCreditUseCase
        self.addMovieToWatchlistUseCase = addMovieToWatchlistUseCase
        self.addTVShowToWatchlistUseCase = addTVShowToWatchlistUseCase
        self.watchListMoviesUseCase = watchListMoviesUseCase
        self.watchListTVShowsUseCase = watchListTVShowsUseCase
        
        print("mediaID -> \(mediaID)")
        if mediaType == .movie {
            LoadMovieDetails()
            loadMovieCredits()
            loadWatchListMovies()
        }else {
            LoadTVShowDetails()
            LoadTVShowDetails()
            loadWatchListTVShows()
        }
    }
    
    private func LoadMovieDetails() {
        self.movieDetailsUseCase.execute(mediaID:self.mediaID) { [weak self] result in
            switch result {
            case .success(let topRatedMovies):
                DispatchQueue.main.async { [weak self] in
                    self?.movieDetailsDTo = topRatedMovies
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    private func loadMovieCredits() {
        self.movieCreditUseCase.execute(mediaID:self.mediaID) { [weak self] result in
            switch result {
            case .success(let movieCredits):
                DispatchQueue.main.async { [weak self] in
                    self?.movieCreditsDTos = movieCredits
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    
    private func LoadTVShowDetails() {
        self.tvShowDetailsUseCase.execute(mediaID:self.mediaID) { [weak self] result in
            switch result {
            case .success(let topRatedMovies):
                DispatchQueue.main.async { [weak self] in
                    self?.tvDetailsDTo = topRatedMovies
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    private func loadTVShowCredits() {
        self.tvShowCreditUseCase.execute(mediaID:self.mediaID) { [weak self] result in
            switch result {
            case .success(let tvShowCreditDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.tvCreditsDtos = tvShowCreditDtos
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func addMediaToWatchlist() {
        switch mediaType {
        case .movie:
            addMovieToWatchLists()
        case .tv:
            addTVShowToWatchLists()
        }
    }
    
    private func addTVShowToWatchLists() {
        self.addTVShowToWatchlistUseCase.execute(mediaType: .tv, mediaID: self.mediaID, addToWatchList: !isAddedToWatchList) { [weak self] result in
            switch result {
            case .success(let watchListResponseDtos):
                DispatchQueue.main.async { [weak self] in
                    if watchListResponseDtos.success == true {
                        self?.isAddedToWatchList.toggle()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    private func addMovieToWatchLists() {
        self.addMovieToWatchlistUseCase.execute(mediaType: .movie, mediaID: self.mediaID, addToWatchList: !isAddedToWatchList) { [weak self] result in
            switch result {
            case .success(let watchListResponseDtos):
                if watchListResponseDtos.success == true {
                    self?.isAddedToWatchList.toggle()
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    private func loadWatchListMovies() {
        self.watchListMoviesUseCase.execute(page: 1) { result in
            print("loadWatchListMovies")
            switch result {
            case .success(let movieItemsDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.isAddedToWatchList = movieItemsDtos.contains(where: { mediaItemDto in
                        self?.mediaID == mediaItemDto.id
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    private func loadWatchListTVShows() {
        self.watchListTVShowsUseCase.execute(page: 1) { result in
            switch result {
            case .success(let tvItemsDtos):
                DispatchQueue.main.async { [weak self] in
                    self?.isAddedToWatchList = tvItemsDtos.contains(where: { mediaItemDto in
                        self?.mediaID == mediaItemDto.id
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    func dismiss() {
        mediaDetailsCoordinator.pop()
    }
    
}


extension MediaDetailsViewModel {
    
    var mediaCredits : [MediaCreditDTO] {
        switch mediaType {
            
        case .movie:
            return self.movieCreditsDTos.filter { mediaCreditDTO in
                return mediaCreditDTO.knownForDepartment == "Acting"
            }
        case .tv:
            return self.tvCreditsDtos.filter { mediaCreditDTO in
                return mediaCreditDTO.knownForDepartment == "Acting"
            }
        }
    }
    
    var title : String {
        switch self.mediaType {
        case .movie:
            return self.movieDetailsDTo?.title ?? ""
        case .tv:
            return self.tvDetailsDTo?.name ?? ""
        }
    }
    
    var overview : String {
        switch self.mediaType {
        case .movie:
            return self.movieDetailsDTo?.overview ?? ""
        case .tv:
            return self.tvDetailsDTo?.overview ?? ""
        }
    }
    
    var ratingText : String {
        switch self.mediaType {
        case .movie:
            let rating = self.movieDetailsDTo?.rating ?? 0
            return "\(rating)"
        case .tv:
            let rating = self.tvDetailsDTo?.rating ?? 0
            return "\(rating)"
        }
    }
    
    var durationTitle : String {
        switch self.mediaType {
        case .movie:
            return "run Time"
        case .tv:
            return "number of episodes"
        }
    }
    
    var durationText : String {
        switch self.mediaType {
        case .movie:
            let hours = self.movieDetailsDTo?.runTime.convertMinutesToHours().hours ?? 0
            let minutes = self.movieDetailsDTo?.runTime.convertMinutesToHours().remainingMinutes ?? 0
            let hoursString = (hours > 0) ? "\(hours) h" : ""
            let minutesString = (minutes > 0) ? "\(minutes) m" : ""
            return "\(hoursString) \(minutesString)"
        case .tv:
            let num = self.tvDetailsDTo?.numberOfEpisodes ?? 0
            return "\(num) ep"
        }
    }
    
    
    var mediaDateTitle : String {
        switch self.mediaType {
        case .movie:
            return "Relase Date"
        case .tv:
            return "First Aired"
        }
    }
    
    var mediaDate : String {
        switch self.mediaType {
        case .movie:
            return self.movieDetailsDTo?.releaseDate ?? ""
        case .tv:
            return self.tvDetailsDTo?.firstAiredDate ?? ""
        }
    }
    
    var genres : String {
        switch self.mediaType {
        case .movie:
            return self.movieDetailsDTo?.genreString ?? ""
        case .tv:
            return self.tvDetailsDTo?.genreString ?? ""
        }
    }
    
    var posterPathUrl : URL? {
        switch self.mediaType {
        case .movie:
            return self.movieDetailsDTo?.posterPathUrl
        case .tv:
            return self.tvDetailsDTo?.posterPathUrl
        }
    }
    
}


