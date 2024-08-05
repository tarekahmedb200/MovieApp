//
//  LogoutServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation


class LogoutServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension LogoutServiceImplementation  : LogoutService {
    
    func logout(logoutRequest: LogoutRequestDTO,completion: @escaping (Result<LogoutResponseDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with:LogoutRequest.logout(logoutRequest), type: LogoutResponseDTO.self) { result  in
            switch result {
            case .success(let logoutResponseDTO):
                completion(.success(logoutResponseDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
