//
//  TopRatedTVShowUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation


protocol TopRatedTVShowUseCase {
    func execute(completion: @escaping (Result<[MediaItemDTO],any Error>) -> Void)
}
