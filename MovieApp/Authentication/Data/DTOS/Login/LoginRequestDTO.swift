//
//  LoginRequestDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation

struct LoginRequestDTO : Codable {
    var username: String
    var password: String
    var requestToken: String
    
    enum CodingKeys : String , CodingKey {
        case username
        case password
        case requestToken = "request_token"
    }
    
}
