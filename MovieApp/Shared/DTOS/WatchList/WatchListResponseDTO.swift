//
//  WatchListResponseDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation

struct WatchListResponseDTO : Codable {
    var statusMessage : String
    var success : Bool
    var statusCode : Int
    
    enum CodingKeys : String , CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success
    }
}
