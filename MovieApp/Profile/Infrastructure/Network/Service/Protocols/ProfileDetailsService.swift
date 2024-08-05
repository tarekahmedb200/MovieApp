//
//  ProfileDetailsService.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

protocol ProfileDetailsService  {
    func requestProfileDetails(completion: @escaping (Result<ProfileDetailsDTO, any Error>) -> Void)
}
