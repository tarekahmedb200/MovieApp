//
//  WatchListTVShowsUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation


final class WatchListTVShowsUseCaseImplementation {
    
    private let mediaWatchListRepository: MediaWatchListRepository
    
    init(mediaWatchListRepository: MediaWatchListRepository) {
        self.mediaWatchListRepository = mediaWatchListRepository
    }
    
}

extension WatchListTVShowsUseCaseImplementation: WatchListTVShowsUseCase {
    
    func execute(page:Int,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaWatchListRepository.requestWatchListTVShows(page:page) { result in
            switch result {
            case .success(let tvItemDtos):
                completion(.success(tvItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
