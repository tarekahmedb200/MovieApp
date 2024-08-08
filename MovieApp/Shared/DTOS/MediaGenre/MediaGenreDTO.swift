//
//  GenreDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

struct MediaGenreContainerDTO : Codable {
    var genres: [MediaGenreDTO]
}

struct MediaGenreDTO : Codable , Identifiable {
    var id : Int64
    var name : String
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
    
    var color: (start: String, end: String) {
        switch self {
        case .action: return ("#FF0000", "#FF4500") // Red to Orange
        case .adventure: return ("#00FF00", "#32CD32") // Green to LimeGreen
        case .animation: return ("#FFD700", "#FFA500") // Gold to Orange
        case .comedy: return ("#FFFF00", "#FFD700") // Yellow to Gold
        case .crime: return ("#8B0000", "#B22222") // DarkRed to FireBrick
        case .documentary: return ("#2E8B57", "#3CB371") // SeaGreen to MediumSeaGreen
        case .drama: return ("#800080", "#9370DB") // Purple to MediumPurple
        case .family: return ("#FF69B4", "#FFB6C1") // HotPink to LightPink
        case .fantasy: return ("#4B0082", "#8A2BE2") // Indigo to BlueViolet
        case .history: return ("#A52A2A", "#D2691E") // Brown to Chocolate
        case .horror: return ("#000000", "#696969") // Black to DimGray
        case .music: return ("#1E90FF", "#00BFFF") // DodgerBlue to DeepSkyBlue
        case .mystery: return ("#483D8B", "#6A5ACD") // DarkSlateBlue to SlateBlue
        case .romance: return ("#FF1493", "#FF69B4") // DeepPink to HotPink
        case .scienceFiction: return ("#00CED1", "#20B2AA") // DarkTurquoise to LightSeaGreen
        case .tvMovie: return ("#4682B4", "#5F9EA0") // SteelBlue to CadetBlue
        case .thriller: return ("#2F4F4F", "#708090") // DarkSlateGray to SlateGray
        case .war: return ("#556B2F", "#6B8E23") // DarkOliveGreen to OliveDrab
        case .western: return ("#D2B48C", "#DEB887") // Tan to BurlyWood
        case .actionAdventure: return ("#FF4500", "#FF6347") // OrangeRed to Tomato
        case .kids: return ("#FFB6C1", "#FFC0CB") // LightPink to Pink
        case .news: return ("#4682B4", "#87CEEB") // SteelBlue to SkyBlue
        case .reality: return ("#8A2BE2", "#9400D3") // BlueViolet to DarkViolet
        case .sciFiFantasy: return ("#00CED1", "#48D1CC") // DarkTurquoise to MediumTurquoise
        case .soap: return ("#FF69B4", "#FFB6C1") // HotPink to LightPink
        case .talk: return ("#87CEEB", "#00BFFF") // SkyBlue to DeepSkyBlue
        case .warPolitics: return ("#556B2F", "#6B8E23") // DarkOliveGreen to OliveDrab
        }
    }
    
    
    var imageName: String {
        switch self {
        case .action: return "action"
        case .adventure: return "adventure"
        case .animation: return "animation"
        case .comedy: return "comedy"
        case .crime: return "crime"
        case .documentary: return "documentry"
        case .drama: return "drama"
        case .family: return "family"
        case .fantasy: return "fantasy"
        case .history: return "history"
        case .horror: return "horror"
        case .music: return "music"
        case .mystery: return "mystery"
        case .romance: return "romance"
        case .scienceFiction: return "science_fiction"
        case .tvMovie: return "tv-movie"
        case .thriller: return "thriller"
        case .war: return "war"
        case .western: return "western"
        case .actionAdventure: return "action"
        case .kids: return "kids"
        case .news: return "news"
        case .reality: return "reality"
        case .sciFiFantasy: return "science_fiction"
        case .soap: return "soap"
        case .talk: return "talk"
        case .warPolitics: return "war"
        }
    }
    
}

