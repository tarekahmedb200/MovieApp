//
//  DefaultMediaDetailsServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation


class DefaultMediaDetailsServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension DefaultMediaDetailsServiceImplementation : MediaDetailsService {
    
    func requestMovieDetails(mediaID: Int64, completion: @escaping (Result<MovieDetailsDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaDetailsRequest.requestMovieDetails(id: mediaID), type: MovieDetailsDTO.self) { result  in
            switch result {
            case .success(let mediaDetailsDto):
                completion(.success(mediaDetailsDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowDetails(mediaID: Int64, completion: @escaping (Result<TVShowDetailsDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaDetailsRequest.requestTVDetails(id: mediaID), type: TVShowDetailsDTO.self) { result  in
            switch result {
            case .success(let mediaDetailsDto):
                completion(.success(mediaDetailsDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestMovieCredits(mediaID: Int64, completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaCreditsRequest.requestMovieCredit(id: mediaID), type: MediaContainerCreditDTO.self) { result  in
            switch result {
            case .success(let mediaContainerCreditDTO):
                completion(.success(mediaContainerCreditDTO.mediaCreditDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowCredits(mediaID: Int64, completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaCreditsRequest.requestTVCredit(id: mediaID), type: MediaContainerCreditDTO.self) { result  in
            switch result {
            case .success(let mediaContainerCreditDTO):
                completion(.success(mediaContainerCreditDTO.mediaCreditDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

