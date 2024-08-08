//
//  MediaListsService.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation

protocol MediaListService {
    
    func requestTopRatedMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestTopRatedTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestUpComingMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestUpComingTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
}
