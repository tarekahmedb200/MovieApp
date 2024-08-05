//
//  LogOutRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

protocol LogoutRepository {
    func logout(completion: @escaping (Result<Bool, any Error>) -> Void)
}
