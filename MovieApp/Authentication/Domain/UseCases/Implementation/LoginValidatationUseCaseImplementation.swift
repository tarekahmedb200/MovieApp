//
//  LoginValidatationUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation


final class LoginValidatationUseCaseImplementation {
    
    private let loginValidationRepository: LoginValidationRepository
    
    init(loginValidationRepository: LoginValidationRepository) {
        self.loginValidationRepository = loginValidationRepository
    }
    
}

extension LoginValidatationUseCaseImplementation: LoginValidatationUseCase {
    
    func execute(completion: @escaping (Bool) -> Void) {
        if isUserInfoExists() && !isExpirationDateEnded() {
            completion(true)
        } else {
            self.loginValidationRepository.clearAll()
            completion(false)
        }
    }
    
    private func isUserInfoExists() -> Bool {
        let userName = self.loginValidationRepository.getUserName()
        let password = self.loginValidationRepository.getPassword()
        return userName != nil && password != nil
    }
    
    private func isExpirationDateEnded() -> Bool {
        guard let expirationDate = getExpirationDate() else {
            return true
        }
        
        let expirationValidator = ExpirationValidator(expireDate: expirationDate)
        
        return expirationValidator.isExpirationDateEnded()
    }
    
    private func getExpirationDate() -> Date? {
        let expirationDateString = self.loginValidationRepository.getExpirationDate()
        
        return expirationDateString?.toDate()
    }
    
    
    
}
