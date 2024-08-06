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
    case requestWatchListMovies(page:Int)
    case requestWatchListTVShows(page:Int)
    
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
    
    var urlParams: [String : String?] {
        var params = [String : String]()
        
        switch self {
        case .requestWatchListMovies(let page):
            params["page"] = "\(page)"
        case .requestWatchListTVShows(let page):
            params["page"] = "\(page)"
        default:
            return [:]
        }
        return params
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


