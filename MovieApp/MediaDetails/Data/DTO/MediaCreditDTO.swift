//
//  MediaCreditDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation



struct MediaContainerCreditDTO: Codable {
    let mediaCreditDtos : [MediaCreditDTO]

    enum CodingKeys: String, CodingKey {
        case mediaCreditDtos = "cast"
    }
}

struct MediaCreditDTO: Codable {
    let name: String
    let knownForDepartment: String
    let profilePath: String?
    
    var posterPathUrl : URL? {
        
        guard let profilePath = profilePath else {
            return nil
        }
        
        let urlString = "https://image.tmdb.org/t/p/original/" + profilePath
        return URL(string: urlString)
    }

    enum CodingKeys: String, CodingKey {
        case name
        case knownForDepartment = "known_for_department"
        case profilePath = "profile_path"
    }
}
