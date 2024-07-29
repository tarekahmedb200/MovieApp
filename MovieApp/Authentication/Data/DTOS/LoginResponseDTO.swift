//
//  LoginResponseDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation

struct LoginResponseDTO : Codable {
    var success : Bool
    var token : String
    
    enum CodingKeys: String, CodingKey {
        case token = "request_token"
        case success
    }
}
