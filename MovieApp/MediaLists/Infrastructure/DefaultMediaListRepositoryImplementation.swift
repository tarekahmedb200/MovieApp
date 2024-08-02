//
//  DefaultMediaListRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation


class DefaultMediaListRepositoryImplementation {
    private var mediaListService : MediaListService
    
    init(mediaListService: MediaListService) {
        self.mediaListService = mediaListService
    }
}

extension DefaultMediaListRepositoryImplementation : MediaListRepository {
    
    func requestUpComingMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestUpComingMovies { result in
            switch result {
            case .success(let TopRatedMovieDTOs):
                completion(.success(TopRatedMovieDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestUpComingTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestUpComingTVShows { result in
            switch result {
            case .success(let TopRatedMovieDTOs):
                completion(.success(TopRatedMovieDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func requestTopRatedMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestTopRatedMovies { result in
            switch result {
            case .success(let TopRatedMovieDTOs):
                completion(.success(TopRatedMovieDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTopRatedTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestTopRatedTVShows { result in
            switch result {
            case .success(let TopRatedTVShowDTOs):
                completion(.success(TopRatedTVShowDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
