//
//  LogoutUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation


final class LogoutUseCaseImplementation {
    
    private let LogoutRepository: LogoutRepository
    
    init(LogoutRepository: LogoutRepository) {
        self.LogoutRepository = LogoutRepository
    }
}

extension LogoutUseCaseImplementation: LogoutUseCase {
    func execute(completion: @escaping (Result<Bool, any Error>) -> Void) {
        self.LogoutRepository.logout { result in
            switch result {
            case .success(let isLoggedOut):
                completion(.success(isLoggedOut))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
