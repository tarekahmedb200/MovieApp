//
//  LogoutRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

enum LogoutRequest : APIRequest {
    case logout(LogoutRequestDTO)
    
    var path: String {
        return "/3/authentication/session"
    }
    
    var httpBody: (any Codable)? {
        switch self {
        case .logout(let logoutRequestDTO):
            return logoutRequestDTO
        }
    }
    
    var requestType: RequestType {
        return .DELETE
    }
}

