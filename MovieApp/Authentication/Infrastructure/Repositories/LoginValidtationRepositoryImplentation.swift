//
//  LoginValidtationRepositoryImplentation.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

class LoginValidtationRepositoryImplentation {
    
    private var appInfoStorage: AuthenticationInfoStorage
    
    init(appInfoStorage: AuthenticationInfoStorage) {
        self.appInfoStorage = appInfoStorage
    }
}

extension LoginValidtationRepositoryImplentation : LoginValidationRepository {
    
    func getPassword() -> String? {
        self.appInfoStorage.getPassword()
    }
    
    func getUserName() -> String? {
        self.appInfoStorage.getUserName()
    }
    
    func getExpirationDate() -> String? {
        self.appInfoStorage.getExpirationDate()
    }
    
}

