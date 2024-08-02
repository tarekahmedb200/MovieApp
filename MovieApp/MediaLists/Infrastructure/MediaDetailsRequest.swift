//
//  MediaDetailsRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation
import MovieAppNetworking

enum MediaDetailsRequest: APIRequest {
    case requestMovieDetails(id:Int64)
    case requestTVDetails(id:Int64)
    
    var path: String {
        switch self {
        case .requestMovieDetails(let id):
            return "/3/movie/\(id)"
        case .requestTVDetails(let id):
            return "/3/tv/\(id)"
        }
    }
    
    var requestType: RequestType {
        return .GET
    }
    
}
