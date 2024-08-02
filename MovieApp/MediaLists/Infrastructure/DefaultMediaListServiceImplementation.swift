//
//  DefaultMediaListServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation
import MovieAppNetworking

class DefaultMediaListServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension DefaultMediaListServiceImplementation : MediaListService {
    
    func requestUpComingMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: UpComingRequest.requestTopRatedMovies, type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDto):
                completion(.success(mediaItemContainerDto.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestUpComingTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: UpComingRequest.requestTopRatedTVShows, type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDto):
                completion(.success(mediaItemContainerDto.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func requestTopRatedMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        
        self.apiManager.initRequest(with: TopRatedRequest.requestTopRatedMovies, type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDto):
                completion(.success(mediaItemContainerDto.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTopRatedTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        
        self.apiManager.initRequest(with: TopRatedRequest.requestTopRatedTV, type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDto):
                completion(.success(mediaItemContainerDto.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
