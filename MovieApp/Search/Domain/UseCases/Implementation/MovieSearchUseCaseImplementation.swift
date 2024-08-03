//
//  MovieSearchUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

final class MovieSearchUseCaseImplementation {
    private var MediaSearchRepository : MediaSearchRepository
    
    init(MediaSearchRepository: MediaSearchRepository) {
        self.MediaSearchRepository = MediaSearchRepository
    }
}

extension MovieSearchUseCaseImplementation: MovieSearchUseCase {
    func execute(searchText: String,page:Int, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.MediaSearchRepository.requestSearchedMovies(searchText: searchText, page: page) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
