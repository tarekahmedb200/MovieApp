//
//  MediaSearchRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation


protocol MediaSearchRepository {
    
    func requestSearchedMovies(searchText:String,page:Int,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestSearchedTVShows(searchText:String,page:Int,completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
}
