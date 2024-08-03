//
//  MediaCreditsRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation


enum MediaCreditsRequest: APIRequest {
    case requestMovieCredit(id:Int64)
    case requestTVCredit(id:Int64)
    
    var path: String {
        switch self {
        case .requestMovieCredit(let id):
            return "/3/movie/\(id)/credits"
        case .requestTVCredit(let id):
            return "/3/tv/\(id)/credits"
        }
    }
    
    var requestType: RequestType {
        return .GET
    }
    
}
