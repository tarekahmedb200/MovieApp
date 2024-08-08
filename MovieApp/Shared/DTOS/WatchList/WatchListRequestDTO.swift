//
//  WatchListRequestDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

struct WatchListRequestDTO : Codable {
    var mediaType: String
    var mediaID: Int64
    var addToWatchList: Bool
    
    enum CodingKeys : String , CodingKey {
        case mediaType = "media_type"
        case mediaID = "media_id"
        case addToWatchList = "watchlist"
    }
}
