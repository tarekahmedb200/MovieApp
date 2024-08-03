//
//  MediaSearchRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

enum MediaSearchRequest : APIRequest {
    case requestSearchedMovies(searchText:String,page:Int)
    case requestSearchedTVShows(searchText:String,page:Int)
    
    var path: String {
        switch self {
        case .requestSearchedMovies:
            return "/3/search/movie"
        case .requestSearchedTVShows:
            return "/3/search/tv"
        }
    }
    
    var urlParams: [String : String?] {
        var params = [String : String]()
        
        switch self {
            
        case .requestSearchedMovies(let searchText,let page):
            params["query"] = "\(searchText)"
            params["page"] = "\(page)"
        case .requestSearchedTVShows(let searchText,let page):
            params["query"] = "\(searchText)"
            params["page"] = "\(page)"
        }
        
        return params
    }
    
    
    var requestType: RequestType {
        return .GET
    }
    
}
