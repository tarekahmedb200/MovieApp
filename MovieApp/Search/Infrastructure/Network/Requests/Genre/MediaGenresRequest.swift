//
//  MediaGenresRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


enum MediaGenresRequest : APIRequest {
    case requestMovieGenres
    case requestTVShowGenres
    
    var path: String {
        switch self {
        case .requestMovieGenres:
            return "/3/genre/movie/list"
        case .requestTVShowGenres:
            return "/3/genre/tv/list"
        }
    }
    
    var requestType: RequestType {
        return .GET
    }
    
}
