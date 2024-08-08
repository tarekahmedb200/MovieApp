//
//  ProfileDetailsUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

protocol ProfileDetailsUseCase {
    func execute(completion: @escaping (Result<ProfileDetailsDTO, any Error>) -> Void)
}
