//
//  ExpirationValidator.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

class ExpirationValidator {
    private var expireDate: Date
    
    init(expireDate: Date) {
        self.expireDate = expireDate
    }
    
    func isExpirationDateEnded() -> Bool {
        guard let timeNow = Date().convertToUTC3() else {
            return true
        }
        return self.expireDate < timeNow
    }
    
}
