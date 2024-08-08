//
//  ProfileRequest.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

enum ProfileRequest : APIRequest {
    case requestDetails
    
    var path: String {
        return "/3/account/0"
    }

    var requestType: RequestType {
        return .GET
    }
}
