//
//  TVShowDetailsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

protocol TVShowDetailsUseCase {
    func execute(mediaID:Int64,completion: @escaping (Result<TVShowDetailsDTO,any Error>) -> Void)
}
