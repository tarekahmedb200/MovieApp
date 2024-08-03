//
//  DefaultMediaGenresServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


class DefaultMediaGenresServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension DefaultMediaGenresServiceImplementation : MediaGenresService {
    
    func requestMovieGenres(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaGenresRequest.requestMovieGenres, type: MediaGenreContainerDTO.self) { result  in
            switch result {
            case .success(let mediaGenreContainerDTO):
                completion(.success(mediaGenreContainerDTO.genres))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestTVShowGenres(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void) {
        self.apiManager.initRequest(with: MediaGenresRequest.requestTVShowGenres, type: MediaGenreContainerDTO.self) { result  in
            switch result {
            case .success(let mediaGenreContainerDTO):
                completion(.success(mediaGenreContainerDTO.genres))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

