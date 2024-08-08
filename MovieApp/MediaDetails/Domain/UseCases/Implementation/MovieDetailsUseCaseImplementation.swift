//
//  MovieDetailsUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//


import Foundation

final class MovieDetailsUseCaseImplementation {
    private var mediaDetailsRepository : MediaDetailsRepository
    
    init(mediaDetailsRepository: MediaDetailsRepository) {
        self.mediaDetailsRepository = mediaDetailsRepository
    }
}

extension MovieDetailsUseCaseImplementation: MovieDetailsUseCase {
    
    func execute(mediaID: Int64, completion: @escaping (Result<MovieDetailsDTO, any Error>) -> Void) {
        self.mediaDetailsRepository.requestMovieDetails(mediaID: mediaID) { result in
            switch result {
            case .success(let movieDetailsDTOs):
                completion(.success(movieDetailsDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

