//
//  RequestTokenImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation


class DefaultAuthenticationImplementation {
    private var apiManager: APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension DefaultAuthenticationImplementation: AuthenticationService {
    
    func requestToken(completion: @escaping (Result<RequestTokenResponseDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with: AuthenticateRequest.requestToken, type: RequestTokenResponseDTO.self) { result  in
            switch result {
            case .success(let requestTokenResponseDTO):
                completion(.success(requestTokenResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func login(loginRequestDTO: LoginRequestDTO, completion: @escaping (Result<LoginResponseDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with:
                                        AuthenticateRequest.login(loginRequestDTO), type: LoginResponseDTO.self) { result  in
            switch result {
            case .success(let loginResponseDTO):
                completion(.success(loginResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestSession(sessionRequestDTO:SessionRequestDTO,completion: @escaping (Result<SessionResponseDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with:
                                        AuthenticateRequest.requestSession(sessionRequestDTO), type: SessionResponseDTO.self) { result  in
            switch result {
            case .success(let sessionResponseDTO):
                completion(.success(sessionResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
