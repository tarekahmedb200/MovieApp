//
//  DefaultMediaGenreContentListServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


class DefaultMediaGenreContentListServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension DefaultMediaGenreContentListServiceImplementation : MediaGenreContentListService {
    
    func requestMovieGenreContentList(genreID: Int64, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaGenreContentRequest.requestMovieGenreContent(genreID: genreID), type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDTO):
                completion(.success(mediaItemContainerDTO.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowGenreContentList(genreID: Int64, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaGenreContentRequest.requestTVShowGenreContent(genreID: genreID), type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDTO):
                completion(.success(mediaItemContainerDTO.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

