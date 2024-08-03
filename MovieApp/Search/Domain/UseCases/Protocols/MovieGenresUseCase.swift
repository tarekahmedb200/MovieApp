//
//  MovieGenresUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


protocol MovieGenresUseCase {
    func execute(completion: @escaping (Result<[MediaGenreDTO],any Error>) -> Void)
}
