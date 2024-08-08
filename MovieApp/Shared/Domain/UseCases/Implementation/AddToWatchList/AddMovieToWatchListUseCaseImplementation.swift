//
//  AddMovieToWatchListUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

final class AddMovieToWatchListUseCaseImplementation {
    
    private let mediaWatchListRepository: MediaWatchListRepository
    
    init(mediaWatchListRepository: MediaWatchListRepository) {
        self.mediaWatchListRepository = mediaWatchListRepository
    }
}

extension AddMovieToWatchListUseCaseImplementation: AddMovieToWatchlistUseCase {
    
    func execute(mediaType: MediaTypeDTO, mediaID: Int64, addToWatchList: Bool, completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void) {
        
        self.mediaWatchListRepository.addMovieToWatchList(watchListRequestDTO: WatchListRequestDTO(mediaType: mediaType.rawValue, mediaID: mediaID, addToWatchList: addToWatchList)) { result in
            switch result {
            case .success(let watchListResponseDTO):
                completion(.success(watchListResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
