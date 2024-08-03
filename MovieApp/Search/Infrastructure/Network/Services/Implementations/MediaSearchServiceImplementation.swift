//
//  MediaSearchServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

class MediaSearchServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension MediaSearchServiceImplementation : MediaSearchService {
    
    func requestSearchedMovies(searchText: String,page:Int, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaSearchRequest.requestSearchedMovies(searchText: searchText, page: page), type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDTO):
                completion(.success(mediaItemContainerDTO.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestSearchedTVShows(searchText: String,page:Int, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaSearchRequest.requestSearchedTVShows(searchText: searchText, page: page), type: MediaItemContainerDTO.self) { result  in
            switch result {
            case .success(let mediaItemContainerDTO):
                completion(.success(mediaItemContainerDTO.mediaItemDTOs))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    

}

