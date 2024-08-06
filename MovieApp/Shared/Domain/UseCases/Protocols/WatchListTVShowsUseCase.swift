//
//  WatchListTVShowsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

protocol WatchListTVShowsUseCase {
    func execute(page:Int,completion: @escaping (Result<[MediaItemDTO],Error>) -> Void)
}
