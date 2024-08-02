//
//  MovieCreditUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation


final class MovieCreditUseCaseImplementation {
    private var mediaDetailsRepository : MediaDetailsRepository
    
    init(mediaDetailsRepository: MediaDetailsRepository) {
        self.mediaDetailsRepository = mediaDetailsRepository
    }
}


extension MovieCreditUseCaseImplementation: MovieCreditsUseCase {
    
    func execute(mediaID: Int64, completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void) {
        self.mediaDetailsRepository.requestMovieCredits(mediaID: mediaID) { result in
            switch result {
            case .success(let movieCreditDTOs):
                completion(.success(movieCreditDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
