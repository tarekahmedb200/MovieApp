//
//  MediaCreditListViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 02/08/2024.
//

import SwiftUI

class MediaCreditListViewModel {
    var mediaCreditsItemViewModels: [MediaCreditItemViewModel]
    
    init(mediaCredits: [MediaCreditDTO]) {
        self.mediaCreditsItemViewModels = mediaCredits.map({ mediaCreditDTO in
            return MediaCreditItemViewModel(mediaCreditDTO: mediaCreditDTO)
        })
    }
}

