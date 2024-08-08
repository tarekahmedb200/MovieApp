//
//  MediaGenreContentRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


enum MediaGenreContentRequest : APIRequest {
    case requestMovieGenreContent(page:Int,genreID:Int64)
    case requestTVShowGenreContent(page:Int,genreID:Int64)
    
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
            
        case .requestMovieGenreContent(let page,let genreID):
            params["with_genres"] = "\(genreID)"
            params["page"] = "\(page)"
        case .requestTVShowGenreContent(let page,genreID: let genreID):
            params["with_genres"] = "\(genreID)"
            params["page"] = "\(page)"
        }
        
        return params
    }
    
    
    var requestType: RequestType {
        return .GET
    }
    
}
