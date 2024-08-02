//
//  AuthenticateUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation
import MovieAppNetworking

final class AuthenticateUseCaseImplementation {
    
    enum AuthenticationState {
        case requestToken
        case login
        case requestSession
    }
    
    private let authenticationRepository: AuthenticationRepository
    private var authenticationState: AuthenticationState
    private var userName: String?
    private var password: String?
    
    init(authenticationRepository: AuthenticationRepository) {
        self.authenticationRepository = authenticationRepository
        authenticationState = .requestToken
    }
    
}

extension AuthenticateUseCaseImplementation: AuthenticateUseCase {
    func execute(userName: String, password: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        self.userName = userName
        self.password = password
        
        handleAuthenticationState(state: .requestToken) { result in
            switch result {
            case .success(let isLoginSuccess):
                completion(.success(isLoginSuccess))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func handleAuthenticationState(state: AuthenticationState,completion: ((Result<Bool,Error>) -> Void)?) {
        switch state {
        case .requestToken:
            self.authenticationRepository.requestToken { [weak self] result in
                switch result {
                case .success(let success):
                    
                    guard success == true else {
                        completion?(.failure(NetworkError.unknown))
                        return
                    }
                    
                    self?.handleAuthenticationState(state: .login, completion: completion)
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        case .login:
            
            guard let userName = self.userName ,
                  let password = self.password else {
                completion?(.failure(NetworkError.unknown))
                return
            }
            
            self.authenticationRepository.login(userName: userName, password: password) { [weak self] result in
                switch result {
                case .success(let success):
                    
                    guard success == true else {
                        completion?(.failure(NetworkError.unknown))
                        return
                    }
                    
                    self?.handleAuthenticationState(state: .requestSession, completion: completion)
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
            
        case .requestSession:
            self.authenticationRepository.requestSession { result in
                switch result {
                case .success(let success):
                    guard success == true else {
                        completion?(.failure(NetworkError.unknown))
                        return
                    }
                    
                    completion?(.success(success))
                case .failure(let error):
                    completion?(.failure(error))
                }
            }
        }
    }
    
    
}
