//
//  MediaGenresService.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


protocol MediaGenresService {
    
    func requestMovieGenres(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void)
    
    func requestTVShowGenres(completion: @escaping (Result<[MediaGenreDTO], any Error>) -> Void)
    
}
