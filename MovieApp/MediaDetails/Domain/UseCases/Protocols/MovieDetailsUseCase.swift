//
//  MovieDetailsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

protocol MovieDetailsUseCase {
    func execute(mediaID:Int64,completion: @escaping (Result<MovieDetailsDTO,any Error>) -> Void)
}
