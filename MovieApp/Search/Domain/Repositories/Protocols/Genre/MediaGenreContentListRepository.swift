//
//  MediaGenreContentListRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


protocol MediaGenreContentListRepository {
    func requestMovieGenreContentList(page:Int,genreID:Int64,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestTVShowGenreContentList(page:Int,genreID:Int64,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
}



