//
//  MovieGenreContentListUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

final class MovieGenreContentListUseCaseImplementation {
    private var mediaGenreContentListRepository : MediaGenreContentListRepository
    
    init(mediaGenreContentListRepository: MediaGenreContentListRepository) {
        self.mediaGenreContentListRepository = mediaGenreContentListRepository
    }
}

extension MovieGenreContentListUseCaseImplementation: MovieGenreContentListUseCase {

    func execute(page:Int,genreID:Int64,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaGenreContentListRepository.requestMovieGenreContentList(page:page,genreID: genreID) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
