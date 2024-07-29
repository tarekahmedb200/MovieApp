//
//  AuthenticationRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation

protocol AuthenticationRepository {
    func requestToken(completion: @escaping (Result<Bool, any Error>) -> Void)
    
    func login(userName: String, password: String, completion: @escaping (Result<Bool, any Error>) -> Void)
    
    func requestSession(completion: @escaping (Result<Bool, any Error>) -> Void)
}
