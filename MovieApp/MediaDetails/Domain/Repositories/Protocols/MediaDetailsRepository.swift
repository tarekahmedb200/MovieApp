//
//  MediaDetailsRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

protocol MediaDetailsRepository {
    
    func requestMovieDetails(mediaID:Int64,completion: @escaping (Result<MovieDetailsDTO, any Error>) -> Void)
    
    func requestTVShowDetails(mediaID:Int64,completion: @escaping (Result<TVShowDetailsDTO, any Error>) -> Void)
    
    func requestMovieCredits(mediaID:Int64,completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void)
    
    func requestTVShowCredits(mediaID:Int64,completion: @escaping (Result<[MediaCreditDTO], any Error>) -> Void)
    
}

