//
//  TVShowSearchUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation


import Foundation

final class TVShowSearchUseCaseImplementation {
    private var MediaSearchRepository : MediaSearchRepository
    
    init(MediaSearchRepository: MediaSearchRepository) {
        self.MediaSearchRepository = MediaSearchRepository
    }
}

extension TVShowSearchUseCaseImplementation: TVShowSearchUseCase {
    func execute(searchText: String,page:Int, completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void) {
        self.MediaSearchRepository.requestSearchedTVShows(searchText: searchText, page: page) { result in
            switch result {
            case .success(let movieItemDtos):
                completion(.success(movieItemDtos))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
