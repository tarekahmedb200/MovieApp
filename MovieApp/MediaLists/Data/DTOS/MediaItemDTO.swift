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
    private var posterPath: String
    
    var genreString : String {
        if  let firstGenre = genres.first,
            let genreString = Genre(rawValue: firstGenre) {
            return genreString.stringValue
        }else {
            return ""
        }
        
    }
    
    var posterPathUrl : URL? {
        let urlString = "https://image.tmdb.org/t/p/original/" + posterPath
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

enum Genre: Int {
    case action = 28
    case adventure = 12
    case animation = 16
    case comedy = 35
    case crime = 80
    case documentary = 99
    case drama = 18
    case family = 10751
    case fantasy = 14
    case history = 36
    case horror = 27
    case music = 10402
    case mystery = 9648
    case romance = 10749
    case scienceFiction = 878
    case tvMovie = 10770
    case thriller = 53
    case war = 10752
    case western = 37
    case actionAdventure = 10759
    case kids = 10762
    case news = 10763
    case reality = 10764
    case sciFiFantasy = 10765
    case soap = 10766
    case talk = 10767
    case warPolitics = 10768

    var stringValue: String {
        switch self {
        case .action: return "Action"
        case .adventure: return "Adventure"
        case .animation: return "Animation"
        case .comedy: return "Comedy"
        case .crime: return "Crime"
        case .documentary: return "Documentary"
        case .drama: return "Drama"
        case .family: return "Family"
        case .fantasy: return "Fantasy"
        case .history: return "History"
        case .horror: return "Horror"
        case .music: return "Music"
        case .mystery: return "Mystery"
        case .romance: return "Romance"
        case .scienceFiction: return "Science Fiction"
        case .tvMovie: return "TV Movie"
        case .thriller: return "Thriller"
        case .war: return "War"
        case .western: return "Western"
        case .actionAdventure: return "Action & Adventure"
        case .kids: return "Kids"
        case .news: return "News"
        case .reality: return "Reality"
        case .sciFiFantasy: return "Sci-Fi & Fantasy"
        case .soap: return "Soap"
        case .talk: return "Talk"
        case .warPolitics: return "War & Politics"
        }
    }
}
