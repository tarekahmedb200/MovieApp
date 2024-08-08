//
//  MovieGenresUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

final class MovieGenresUseCaseImplementation {
    private var mediaGenresRepository : MediaGenresRepository
    
    init(mediaGenresRepository: MediaGenresRepository) {
        self.mediaGenresRepository = mediaGenresRepository
    }
}

extension MovieGenresUseCaseImplementation: MovieGenresUseCase {
    func execute(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void) {
        self.mediaGenresRepository.requestMovieGenres { result in
            switch result {
            case .success(let movieGenreDtos):
                completion(.success(movieGenreDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
  
}
