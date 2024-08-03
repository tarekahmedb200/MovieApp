//
//  TopRatedRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation



enum TopRatedRequest : APIRequest {
    case requestTopRatedMovies
    case requestTopRatedTV
    
    var path: String {
        switch self {
        case .requestTopRatedMovies:
            return "/3/movie/top_rated"
        case .requestTopRatedTV:
            return "/3/tv/top_rated"
        }
    }
    
    var requestType: RequestType {
        return .GET
    }
    
}
