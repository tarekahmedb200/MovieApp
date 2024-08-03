//
//  RequestTokenResponseDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation


struct RequestTokenResponseDTO : Decodable {
    var success : Bool
    var token : String
    var expirationDateString : String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case token = "request_token"
        case expirationDateString = "expires_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        success = try container.decode(Bool.self, forKey: .success)
        token = try container.decode(String.self, forKey: .token)
        
        let expirationDateString = try container.decode(String.self, forKey: .expirationDateString)
        
        if let expirationDate = expirationDateString.toDate(),
           let expirationDateUTC2 = expirationDate.convertToUTC3(),
           let expirationDateUTC2String = expirationDateUTC2.toString() {
            self.expirationDateString = expirationDateUTC2String
        }
        
    }
    
    
    
}
