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
    
    private var mediaListCoordinator : MediaListCoordinator
    
    init(mediaType:MediaTypeDTO,mediaID:Int64,movieDetailsUseCase: MovieDetailsUseCase, tvShowDetailsUseCase: TVShowDetailsUseCase,
         movieCreditUseCase : MovieCreditsUseCase,
         tvShowCreditUseCase : TVShowCreditUseCase,
         mediaListCoordinator: MediaListCoordinator) {
        self.mediaID = mediaID
        self.mediaType = mediaType
        self.movieDetailsUseCase = movieDetailsUseCase
        self.tvShowDetailsUseCase = tvShowDetailsUseCase
        self.mediaListCoordinator = mediaListCoordinator
        self.movieCreditUseCase = movieCreditUseCase
        self.tvShowCreditUseCase = tvShowCreditUseCase
        
        print("mediaID -> \(mediaID)")
        if mediaType == .movie {
            LoadMovieDetails()
            loadMovieCredits()
        }else {
            LoadTVShowDetails()
            loadTVShowCredits()
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


