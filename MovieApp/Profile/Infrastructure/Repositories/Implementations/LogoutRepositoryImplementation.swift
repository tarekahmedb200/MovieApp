//
//  LogoutRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

class LogoutRepositoryImplementation {
    
    private var logoutService: LogoutService
    private var appInfoStorage: AuthenticationInfoStorage
    
    init(logoutService: LogoutService, appInfoStorage: AuthenticationInfoStorage) {
        self.logoutService = logoutService
        self.appInfoStorage = appInfoStorage
    }
}

extension LogoutRepositoryImplementation : LogoutRepository {
    
    func logout(completion: @escaping (Result<Bool, any Error>) -> Void) {
        
        guard let sessionID = self.appInfoStorage.getSessionID() else {
            completion(.failure(NetworkError.unknown))
            return
        }
        
        let loginReqeustDTO = LogoutRequestDTO(sessionID: sessionID)
        
        self.logoutService.logout(logoutRequest: loginReqeustDTO) { result in
            switch result {
            case .success(let logoutResponseDTO):
                self.appInfoStorage.clearAll()
                completion(.success(true))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
}
 
