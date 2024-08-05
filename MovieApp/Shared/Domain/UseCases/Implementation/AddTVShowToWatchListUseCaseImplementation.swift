//
//  AddTVShowToWatchListUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

final class AddTVShowToWatchListUseCaseImplementation {
    
    private let mediaWatchListRepository: MediaWatchListRepository
    
    init(mediaWatchListRepository: MediaWatchListRepository) {
        self.mediaWatchListRepository = mediaWatchListRepository
    }
    
}

extension AddTVShowToWatchListUseCaseImplementation: AddTVShowToWatchlistUseCase {
    
    func execute(mediaType: MediaTypeDTO, mediaID: Int64, addToWatchList favorite: Bool, completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void) {
        
        self.mediaWatchListRepository.addTVShowToWatchList(watchListRequestDTO: WatchListRequestDTO(mediaType: mediaType.rawValue, mediaID: mediaID, addToWatchList: favorite)) { result in
            switch result {
            case .success(let watchListResponseDTO):
                completion(.success(watchListResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}


