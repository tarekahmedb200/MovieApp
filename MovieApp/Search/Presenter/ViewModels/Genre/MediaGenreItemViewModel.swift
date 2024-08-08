//
//  MediaGenreItemViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation

class MediaGenreItemViewModel : Identifiable {
  
    var id: Int64
    var title: String
    var gridentColor: (startColor:String,endColor:String)
    var imageName: String
  
    init(mediaGenreDTO: MediaGenreDTO) {
        id = mediaGenreDTO.id
        gridentColor = Genre(rawValue: Int(id))?.color ?? ("#00000","#00000")
        imageName = Genre(rawValue: Int(id))?.imageName ?? ""
        title = mediaGenreDTO.name
    }
    
}
