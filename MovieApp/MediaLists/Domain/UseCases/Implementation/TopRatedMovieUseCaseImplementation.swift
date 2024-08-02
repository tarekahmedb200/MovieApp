//
//  TopRatedMediaUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation

final class TopRatedMovieUseCaseImplementation {
    private var mediaListRepository : MediaListRepository
    
    init(mediaListRepository: MediaListRepository) {
        self.mediaListRepository = mediaListRepository
    }
}


extension TopRatedMovieUseCaseImplementation: TopRatedMovieUseCase {
    
    func execute(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListRepository.requestTopRatedMovies { result in
            switch result {
            case .success(let mediaItemDTOs):
                completion(.success(mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

