//
//  MediaWatchListRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

protocol MediaWatchListRepository {
    
    func addMovieToWatchList(watchListRequestDTO:WatchListRequestDTO,completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void)
    
    func addTVShowToWatchList(watchListRequestDTO:WatchListRequestDTO,completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void)
    
    func requestWatchListMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestWatchListTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
}
