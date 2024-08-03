//
//  MediaTypeDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

enum MediaTypeDTO : String, Identifiable , CaseIterable {
    case movie
    case tv
    
    var id : String {
        UUID().uuidString
    }
}
