//
//  AuthenticationService.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

protocol AuthenticationService {
    
    func requestToken(completion: @escaping (Result<RequestTokenResponseDTO, any Error>) -> Void)
    
    func login(loginRequestDTO:LoginRequestDTO,completion: @escaping (Result<LoginResponseDTO, any Error>) -> Void)
    
    func requestSession(sessionRequestDTO:SessionRequestDTO,completion: @escaping (Result<SessionResponseDTO, any Error>) -> Void)
    
}
