//
//  WatchListMoviesUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

final class WatchListMoviesUseCaseImplementation {
    
    private let mediaWatchListRepository: MediaWatchListRepository
    
    init(mediaWatchListRepository: MediaWatchListRepository) {
        self.mediaWatchListRepository = mediaWatchListRepository
    }
    
}

extension WatchListMoviesUseCaseImplementation: WatchListMoviesUseCase {
    
    func execute(page:Int,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaWatchListRepository.requestWatchListMovies(page: page) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
