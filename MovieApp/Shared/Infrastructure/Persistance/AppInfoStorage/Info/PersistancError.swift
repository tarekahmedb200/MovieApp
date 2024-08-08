//
//  PersistancError.swift
//  MovieApp
//
//  Created by tarek ahmed on 08/08/2024.
//

import Foundation


enum PersistancError: LocalizedError {
    
    case valueNotFound
   
    public var errorDescription: String? {
        switch self {
        case .valueNotFound:
            return "Value Not Found"
        }
    }
}
