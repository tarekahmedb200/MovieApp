//
//  MediaGenreContentListService.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

protocol MediaGenreContentListService {
    
    func requestMovieGenreContentList(genreID:Int64,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestTVShowGenreContentList(genreID:Int64,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
}
