//
//  TVShowCreditUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


final class TVShowCreditUseCaseImplementation {
    private var mediaDetailsRepository : MediaDetailsRepository
    
    init(mediaDetailsRepository: MediaDetailsRepository) {
        self.mediaDetailsRepository = mediaDetailsRepository
    }
}


extension TVShowCreditUseCaseImplementation: TVShowCreditUseCase {
    
    func execute(mediaID: Int64, completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void) {
        self.mediaDetailsRepository.requestTVShowCredits(mediaID: mediaID) { result in
            switch result {
            case .success(let tvCreditDTOs):
                completion(.success(tvCreditDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
