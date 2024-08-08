//
//  MediaGenresRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


class MediaGenresRepositoryImplementation {
    private var mediaGenreService : MediaGenresService
    
    init(mediaGenreService: MediaGenresService) {
        self.mediaGenreService = mediaGenreService
    }
}

extension MediaGenresRepositoryImplementation : MediaGenresRepository {
    
    func requestMovieGenres(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void) {
        self.mediaGenreService.requestMovieGenres { result in
                switch result {
                case .success(let movieGenres):
                    completion(.success(movieGenres))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
    func requestTVShowGenres(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void) {
        self.mediaGenreService.requestTVShowGenres { result in
                switch result {
                case .success(let tvGenres):
                    completion(.success(tvGenres))
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }
    
}
