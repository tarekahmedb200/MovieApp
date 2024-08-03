//
//  DefaultMediaDetailsRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

class DefaultMediaDetailsRepositoryImplementation {
    private var mediaDetailsService : MediaDetailsService
    
    init(mediaDetailsService: MediaDetailsService) {
        self.mediaDetailsService = mediaDetailsService
    }
}

extension DefaultMediaDetailsRepositoryImplementation : MediaDetailsRepository {
    
    func requestMovieCredits(mediaID: Int64, completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void) {
        self.mediaDetailsService.requestMovieCredits(mediaID: mediaID) { result in
            switch result {
            case .success(let movieCreditDto):
                completion(.success(movieCreditDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowCredits(mediaID: Int64, completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void) {
        self.mediaDetailsService.requestTVShowCredits(mediaID: mediaID) { result in
            switch result {
            case .success(let tvCreditDto):
                completion(.success(tvCreditDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestMovieDetails(mediaID: Int64, completion: @escaping (Result<MovieDetailsDTO, any Error>) -> Void) {
        self.mediaDetailsService.requestMovieDetails(mediaID: mediaID) { result in
            switch result {
            case .success(let movieDetailsDto):
                completion(.success(movieDetailsDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowDetails(mediaID: Int64, completion: @escaping (Result<TVShowDetailsDTO, any Error>) -> Void) {
        
        self.mediaDetailsService.requestTVShowDetails(mediaID: mediaID) { result in
            switch result {
            case .success(let tvDetailsDto):
                completion(.success(tvDetailsDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
