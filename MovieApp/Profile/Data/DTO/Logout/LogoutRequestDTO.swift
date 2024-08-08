//
//  LogoutRequestDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

struct LogoutRequestDTO : Codable {
    var sessionID : String
        
    enum CodingKeys : String , CodingKey {
        case sessionID = "session_id"
    }
    
}
