//
//  TVShowGenresUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


final class TVShowGenresUseCaseImplementation {
    private var mediaGenresRepository : MediaGenresRepository
    
    init(mediaGenresRepository: MediaGenresRepository) {
        self.mediaGenresRepository = mediaGenresRepository
    }
}

extension TVShowGenresUseCaseImplementation: TVShowGenresUseCase {
    func execute(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void) {
        self.mediaGenresRepository.requestTVShowGenres { result in
            switch result {
            case .success(let tvGenreDtos):
                completion(.success(tvGenreDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
