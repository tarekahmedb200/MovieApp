//
//  MediaGenreContentListRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

class MediaGenreContentListRepositoryImplementation {
    private var mediaGenreContentListService : MediaGenreContentListService
    
    init(mediaGenreContentListService: MediaGenreContentListService) {
        self.mediaGenreContentListService = mediaGenreContentListService
    }
}

extension MediaGenreContentListRepositoryImplementation : MediaGenreContentListRepository {
    
    func requestMovieGenreContentList(genreID: Int64, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaGenreContentListService.requestMovieGenreContentList(genreID: genreID) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowGenreContentList(genreID: Int64, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaGenreContentListService.requestTVShowGenreContentList(genreID: genreID) { result in
            switch result {
            case .success(let tvItemDtos):
                completion(.success(tvItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
