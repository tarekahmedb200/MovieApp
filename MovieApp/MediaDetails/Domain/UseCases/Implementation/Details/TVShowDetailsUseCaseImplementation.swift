//
//  TVShowDetailsUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

import Foundation

final class TVShowDetailsUseCaseImplementation {
    private var mediaDetailsRepository : MediaDetailsRepository
    
    init(mediaDetailsRepository: MediaDetailsRepository) {
        self.mediaDetailsRepository = mediaDetailsRepository
    }
}


extension TVShowDetailsUseCaseImplementation: TVShowDetailsUseCase {
    
    func execute(mediaID: Int64, completion: @escaping (Result<TVShowDetailsDTO, any Error>) -> Void) {
        self.mediaDetailsRepository.requestTVShowDetails(mediaID: mediaID) { result in
            switch result {
            case .success(let tvDetailsDTOs):
                completion(.success(tvDetailsDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
