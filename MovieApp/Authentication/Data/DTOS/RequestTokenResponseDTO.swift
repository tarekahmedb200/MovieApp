//
//  RequestTokenResponseDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation


struct RequestTokenResponseDTO : Codable {
    var success : Bool
    var token : String
    
    enum CodingKeys: String, CodingKey {
        case success
        case token = "request_token"
    }
}
