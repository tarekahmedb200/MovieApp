//
//  MediaGenreContentRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


enum MediaGenreContentRequest : APIRequest {
    case requestMovieGenreContent(genreID:Int64)
    case requestTVShowGenreContent(genreID:Int64)
    
    var path: String {
        switch self {
        case .requestMovieGenreContent:
            return "/3/discover/movie"
        case .requestTVShowGenreContent:
            return "/3/discover/tv"
        }
    }
    
    var urlParams: [String : String?] {
        var params = [String : String]()
        
        switch self {
            
        case .requestMovieGenreContent(genreID: let genreID):
            params["with_genres"] = "\(genreID)"
        case .requestTVShowGenreContent(genreID: let genreID):
            params["with_genres"] = "\(genreID)"
        }
        
        return params
    }
    
    
    var requestType: RequestType {
        return .GET
    }
    
}
