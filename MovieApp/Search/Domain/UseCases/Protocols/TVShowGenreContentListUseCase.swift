//
//  TVShowGenreContentListUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

protocol TVShowGenreContentListUseCase {
    func execute(genreID:Int64,completion: @escaping (Result<[MediaItemDTO],any Error>) -> Void)
}
