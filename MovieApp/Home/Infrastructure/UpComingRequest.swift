//
//  UpComingRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 31/07/2024.
//

import Foundation


enum UpComingRequest: APIRequest {
    case requestUpComingMovies
    case requestUpComingTVShows
    
    var path: String {
        switch self {
        case .requestUpComingMovies:
            return "/3/movie/upcoming"
        case .requestUpComingTVShows:
            return "/3/discover/tv"
        }
    }
    
    var requestType: RequestType {
        return .GET
    }
    
}
