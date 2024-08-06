//
//  MediaWatchListRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation


class MediaWatchListRepositoryImplementation {
    private var mediaWatchListService : MediaWatchListService
    
    init(mediaWatchListService: MediaWatchListService) {
        self.mediaWatchListService = mediaWatchListService
    }
}

extension MediaWatchListRepositoryImplementation : MediaWatchListRepository {
    
    func addMovieToWatchList(watchListRequestDTO: WatchListRequestDTO, completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void) {
        self.mediaWatchListService.addMovieToWatchList(watchlistRequestDTO: watchListRequestDTO) { result in
            switch result {
            case .success(let WatchListResponseDTO):
                completion(.success(WatchListResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func addTVShowToWatchList(watchListRequestDTO: WatchListRequestDTO, completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void) {
        self.mediaWatchListService.addTVShowToWatchlist(watchListRequestDTO: watchListRequestDTO) { result in
            switch result {
            case .success(let watchListResponseDTO):
                completion(.success(watchListResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestWatchListMovies(page:Int,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaWatchListService.requestWatchListMovies(page:page) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestWatchListTVShows(page:Int,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaWatchListService.requestWatchListTVShows(page:page) { result in
            switch result {
            case .success(let tvItemDtos):
                completion(.success(tvItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
