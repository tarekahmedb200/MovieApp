//
//  LogoutResponseDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

struct LogoutResponseDTO : Codable {
    var success : Bool
    var sessionID : String?
    
    enum CodingKeys : String , CodingKey {
        case success
        case sessionID = "session_id"
    }
}
