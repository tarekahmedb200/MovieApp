//
//  MediaWatchListService.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

protocol MediaWatchListService {
    
    func addMovieToWatchList(watchlistRequestDTO:WatchListRequestDTO,completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void)
    
    func addTVShowToWatchlist(watchListRequestDTO:WatchListRequestDTO,completion: @escaping (Result<WatchListResponseDTO, any Error>) -> Void)
    
    func requestWatchListMovies(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
    func requestWatchListTVShows(completion: @escaping (Result<[MediaItemDTO], any Error>) -> Void)
    
}
