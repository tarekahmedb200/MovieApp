//
//  DefaultAuthenticationImplentationRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation


class DefaultAuthenticationImplentationRepository {
    
    private var authenticationService: AuthenticationService
    private var appInfoStorage: AppInfoStorage
    
    init(authenticationService: AuthenticationService, appInfoStorage: AppInfoStorage) {
        self.authenticationService = authenticationService
        self.appInfoStorage = appInfoStorage
    }
}

extension DefaultAuthenticationImplentationRepository : AuthenticationRepository {
    
    
    func requestToken(completion: @escaping (Result<Bool, any Error>) -> Void) {
        self.authenticationService.requestToken { result in
            switch result {
            case .success(let requestTokenResponseDTO):
                self.appInfoStorage.saveRequestToken(requestToken: requestTokenResponseDTO.token)
                completion(.success(requestTokenResponseDTO.success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func login(userName: String, password: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
        
        guard let token = appInfoStorage.getRequestToken() else {
            completion(.failure(NetworkError.unknown))
            return
        }
        
        let loginRequestDTO = LoginRequestDTO(username: userName, password: password, requestToken: token)
        
        self.authenticationService.login(loginRequestDTO: loginRequestDTO) { result in
            switch result {
            case .success(let loginResponseDTO):
                self.appInfoStorage.saveRequestToken(requestToken: loginResponseDTO.token)
                completion(.success(loginResponseDTO.success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func requestSession(completion: @escaping (Result<Bool, any Error>) -> Void) {
        
        guard let token = appInfoStorage.getRequestToken() else {
            completion(.failure(NetworkError.unknown))
            return
        }
        
        let sessionRequestDTO = SessionRequestDTO(token: token)
        
        self.authenticationService.requestSession(sessionRequestDTO: sessionRequestDTO) { result in
            switch result {
            case .success(let sessionResponseDTO):
                
                guard let sessionID = sessionResponseDTO.sessionID else {
                    completion(.failure(NetworkError.unknown))
                    return
                }
                
                self.appInfoStorage.saveSessionID(sessionID: sessionID)
                completion(.success(sessionResponseDTO.success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    
    }
    
}
