//
//  TVShowSearchUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

protocol TVShowSearchUseCase {
    func execute(searchText:String,page:Int,completion: @escaping (Result<[MediaItemDTO],any Error>) -> Void)
}
