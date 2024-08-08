//
//  TopRatedTVShowUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

final class TopRatedTVShowUseCaseImplementation {
    private var mediaListRepository : MediaListRepository
    
    init(mediaListRepository: MediaListRepository) {
        self.mediaListRepository = mediaListRepository
    }
}


extension TopRatedTVShowUseCaseImplementation: TopRatedTVShowUseCase {
    
    func execute(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListRepository.requestTopRatedTVShows { result in
            switch result {
            case .success(let mediaItemDTOs):
                completion(.success(mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
