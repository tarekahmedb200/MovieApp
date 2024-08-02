//
//  TVShowCreditUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

protocol TVShowCreditUseCase {
    func execute(mediaID:Int64,completion: @escaping (Result<[MediaCreditDTO],any Error>) -> Void)
}
