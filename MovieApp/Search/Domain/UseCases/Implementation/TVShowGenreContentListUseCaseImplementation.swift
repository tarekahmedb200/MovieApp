//
//  TVShowGenreContentListUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


final class TVShowGenreContentListUseCaseImplementation {
    private var mediaGenreContentListRepository : MediaGenreContentListRepository
    
    init(mediaGenreContentListRepository: MediaGenreContentListRepository) {
        self.mediaGenreContentListRepository = mediaGenreContentListRepository
    }
}

extension TVShowGenreContentListUseCaseImplementation: TVShowGenreContentListUseCase {

    func execute(genreID:Int64,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.mediaGenreContentListRepository.requestTVShowGenreContentList(genreID: genreID) { result in
            switch result {
            case .success(let tvItemDtos):
                completion(.success(tvItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
