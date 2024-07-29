//
//  Authenticate.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

enum AuthenticateRequest : Request {
    case requestToken
    case login(LoginRequestDTO)
    case requestSession(SessionRequestDTO)
    
    var path: String {
        switch self {
        case .requestToken:
            return "/3/authentication/token/new"
        case .login:
            return "/3/authentication/token/validate_with_login"
        case .requestSession:
            return "/3/authentication/session/new"
        }
    }
    
    var requestType: RequestType {
        switch self {
        case .requestToken:
            return .GET
        case .login , .requestSession:
            return .POST
        }
    }
    
    var httpBody: (any Codable)? {
        switch self {
        case .login(let loginRequestDTO):
           return loginRequestDTO
        case .requestSession(let sessionRequestDTO):
            return sessionRequestDTO
        default :
            return nil
        }
    }
    
}
