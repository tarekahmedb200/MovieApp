//
//  UpComingMoviesUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation

protocol UpComingMoviesUseCase {
    func execute(completion: @escaping (Result<[MediaItemDTO],any Error>) -> Void)
}
