//
//  TopRatedMediaUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation


protocol TopRatedMovieUseCase {
    func execute(completion: @escaping (Result<[MediaItemDTO],any Error>) -> Void)
}
