//
//  MediaWatchListServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

class MediaWatchListServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension MediaWatchListServiceImplementation : MediaWatchListService {

    func addMovieToWatchList(watchlistRequestDTO: WatchListRequestDTO, completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void) {
        
        self.apiManager.initRequest(with:MediaWatchListRequest.addMovieToWatchList(watchlistRequestDTO), type: WatchListResponseDTO.self) { result  in
            switch result {
            case .success(let mediaWatchListResponseDto):
                completion(.success(mediaWatchListResponseDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    func addTVShowToWatchlist(watchListRequestDTO: WatchListRequestDTO, completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void) {
        
        self.apiManager.initRequest(with:MediaWatchListRequest.addTVShowToWatchList(watchListRequestDTO), type: WatchListResponseDTO.self) { result  in
            switch result {
            case .success(let mediaWatchListResponseDto):
                completion(.success(mediaWatchListResponseDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestWatchListMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        
        self.apiManager.initRequest(with:MediaWatchListRequest.requestWatchListMovies, type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDTO):
                completion(.success(mediaItemContainerDTO.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestWatchListTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with:MediaWatchListRequest.requestWatchListTVShows, type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDTO):
                completion(.success(mediaItemContainerDTO.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
