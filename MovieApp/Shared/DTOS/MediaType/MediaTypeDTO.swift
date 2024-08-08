//
//  MediaTypeDTO.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

enum MediaTypeDTO : String, Identifiable , CaseIterable {
    
    var id: String {
        UUID().uuidString
    }
    
    case movie
    case tv
}
