//
//  NetworkError.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

enum NetworkError: LocalizedError {
    
    case invalidServerResponse
    case invalidURL
    case unknown
    
    public var errorDescription: String? {
        switch self {
        case .invalidServerResponse:
            return "The server returned an invalid response."
        case .invalidURL:
            return "URL string is malformed."
        case .unknown :
            return "UnKnown error..."
        }
    }
    
}
