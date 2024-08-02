//
//  UpComingTVShowsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation

protocol UpComingTVShowsUseCase {
    func execute(completion: @escaping (Result<[MediaItemDTO],any Error>) -> Void)
}
