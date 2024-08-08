//
//  MediaSearchRepositoryImplemenetation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation


class MediaSearchRepositoryImplemenetation {
    private var MediaSearchService : MediaSearchService
    
    init(MediaSearchService: MediaSearchService) {
        self.MediaSearchService = MediaSearchService
    }
}

extension MediaSearchRepositoryImplemenetation : MediaSearchRepository {
    
    func requestSearchedMovies(searchText: String,page:Int, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.MediaSearchService.requestSearchedMovies(searchText: searchText, page: page) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestSearchedTVShows(searchText: String,page:Int, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.MediaSearchService.requestSearchedTVShows(searchText: searchText, page: page) { result in
            switch result {
            case .success(let tvItemDtos):
                completion(.success(tvItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
}
