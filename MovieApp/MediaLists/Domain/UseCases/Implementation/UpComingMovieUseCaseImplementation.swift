//
//  UpComingMovieUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation

final class UpComingMovieUseCaseImplementation {
    private var mediaListRepository : MediaListRepository
    
    init(mediaListRepository: MediaListRepository) {
        self.mediaListRepository = mediaListRepository
    }
}


extension UpComingMovieUseCaseImplementation: UpComingMoviesUseCase {
    
    func execute(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListRepository.requestUpComingMovies { result in
            switch result {
            case .success(let mediaItemDTOs):
                completion(.success(mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
