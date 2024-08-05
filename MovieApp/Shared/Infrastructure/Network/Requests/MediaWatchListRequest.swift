//
//  MediaWatchListRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

enum MediaWatchListRequest: APIRequest {
    case addMovieToWatchList(WatchListRequestDTO)
    case addTVShowToWatchList(WatchListRequestDTO)
    case requestWatchListMovies
    case requestWatchListTVShows
    
    var path: String {
        switch self {
        case .addMovieToWatchList,.addTVShowToWatchList:
            return "/3/account/0/watchlist"
        case .requestWatchListMovies:
            return "/3/account/0/watchlist/movies"
        case .requestWatchListTVShows:
            return "/3/account/0/watchlist/tv"
        }
    }
    
    var httpBody: (any Codable)? {
        switch self {
        case .addMovieToWatchList(let WatchListRequestDTO):
            return WatchListRequestDTO
        case .addTVShowToWatchList(let WatchListRequestDTO):
            return WatchListRequestDTO
        default :
            return nil
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .addMovieToWatchList,.addTVShowToWatchList:
            return .POST
        case .requestWatchListMovies, .requestWatchListTVShows:
            return .GET
        }
    }
}


