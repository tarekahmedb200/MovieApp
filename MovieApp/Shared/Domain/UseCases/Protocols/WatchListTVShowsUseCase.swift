//
//  WatchListTVShowsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

protocol WatchListTVShowsUseCase {
    func execute(completion: @escaping (Result<[MediaItemDTO],Error>) -> Void)
}
