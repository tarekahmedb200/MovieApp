//
//  MediaListRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation


class MediaListRepositoryImplementation {
    private var mediaListService : MediaListService
    
    init(mediaListService: MediaListService) {
        self.mediaListService = mediaListService
    }
}

extension MediaListRepositoryImplementation : MediaListRepository {
    
    func requestUpComingMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestUpComingMovies { result in
            switch result {
            case .success(let upComingMovieDTOs):
                completion(.success(upComingMovieDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestUpComingTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestUpComingTVShows { result in
            switch result {
            case .success(let upComingTVShowsDTOs):
                completion(.success(upComingTVShowsDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    func requestTopRatedMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestTopRatedMovies { result in
            switch result {
            case .success(let topRatedMovieDTOs):
                completion(.success(topRatedMovieDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTopRatedTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaListService.requestTopRatedTVShows { result in
            switch result {
            case .success(let topRatedTVShowDTOs):
                completion(.success(topRatedTVShowDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
