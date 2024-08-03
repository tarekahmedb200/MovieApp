//
//  MediaItemDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation

struct MediaItemContainerDTO : Decodable {
    var mediaItemDTOs : [MediaItemDTO]
    
    enum CodingKeys: String , CodingKey {
        case mediaItemDTOs = "results"
    }
}

struct MediaItemDTO : Decodable {
    var id: Int64
    var title: String?
    private var genres: [Int]
    private var posterPath: String?
    
    var genreString : String {
        if  let firstGenre = genres.first,
            let genreString = Genre(rawValue: firstGenre) {
            return genreString.stringValue
        }else {
            return ""
        }
    }
    
    var posterPathUrl : URL? {
        
        guard let posterPath = posterPath else {
            return nil
        }
        
        let urlString = "https://image.tmdb.org/t/p/w200/" + posterPath
        return URL(string: urlString)
    }
    
    enum CodingKeys: String , CodingKey {
        case id
        case title
        case name
        case genres = "genre_ids"
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int64.self, forKey: .id)
        genres = try container.decode([Int].self, forKey: .genres)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        
        let titleKey = container.allKeys.first(where: { $0 == .title || $0 == .name })
        if let titleKey = titleKey {
            title = try container.decode(String.self, forKey: titleKey)
        }
    }
}


extension MediaItemDTO {
    init(id: Int64, title: String? = nil, genres: [Int], posterPath: String) {
        self.id = id
        self.title = title
        self.genres = genres
        self.posterPath = posterPath
    }
}

