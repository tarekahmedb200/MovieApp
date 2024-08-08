//
//  MovieCreditsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation


protocol MovieCreditsUseCase {
    func execute(mediaID:Int64,completion: @escaping (Result<[MediaCreditDTO],any Error>) -> Void)
}
