//
//  AddMovieToWatchlistUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 03/08/2024.
//

import Foundation


protocol AddMovieToWatchlistUseCase {
    func execute(mediaType : MediaTypeDTO,
    mediaID : Int64,
                 addToWatchList : Bool,completion: @escaping (Result<WatchListResponseDTO,Error>) -> Void)
}
