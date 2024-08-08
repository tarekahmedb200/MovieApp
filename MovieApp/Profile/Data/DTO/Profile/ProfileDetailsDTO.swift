//
//  ProfileDetailsDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation


struct ProfileDetailsDTO: Codable {
    let username: String
    private let avatar: Avatar
    
    var posterPathUrl : URL? {
        guard let path = avatar.tmdb.avatarPath else {
            return nil
        }
        
        let urlString = "https://image.tmdb.org/t/p/original/" + path
        return URL(string: urlString)
    }

    enum CodingKeys: String, CodingKey {
        case avatar
        case username
    }
}

struct Avatar: Codable {
    let tmdb: TMDB

    enum CodingKeys: String, CodingKey {
        case tmdb
    }
}

struct TMDB: Codable {
    let avatarPath: String? // Optional to handle cases where avatar_path is missing

    enum CodingKeys: String, CodingKey {
        case avatarPath = "avatar_path"
    }
}
