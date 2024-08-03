//
//  MediaCreditItemViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import Foundation


class MediaCreditItemViewModel : Identifiable {
    
    var title: String
    var posterURL: URL?

    init(mediaCreditDTO: MediaCreditDTO) {
        title = mediaCreditDTO.name
        posterURL = mediaCreditDTO.posterPathUrl
    }
    
}
