//
//  UpComingRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation
import MovieAppNetworking

enum UpComingRequest: APIRequest {
    case requestTopRatedMovies
    case requestTopRatedTVShows
    
    var path: String {
        switch self {
        case .requestTopRatedMovies:
            return "/3/movie/upcoming"
        case .requestTopRatedTVShows:
            return "/3/discover/tv"
        }
    }
    
    var requestType: RequestType {
        return .GET
    }
    
}
