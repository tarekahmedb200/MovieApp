//
//  SessionResponseDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation

struct SessionResponseDTO : Codable {
    var success : Bool
    var sessionID : String?
    
    enum CodingKeys : String , CodingKey {
        case success
        case sessionID = "session_id"
    }
}
