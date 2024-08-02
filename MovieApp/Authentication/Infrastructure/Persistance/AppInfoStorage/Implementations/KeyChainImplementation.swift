//
//  KeyChainImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation
import KeychainSwift

class KeyChainImplementation : AuthenticationInfoStorage {
    
    enum Keys: String {
        case requestTokenKey = "token"
        case sessionIDKey = "session"
        case expirationDate = "expiration_date"
        case password = "password"
        case userName = "userName"
    }
    
    private var keyChainStack = KeyChainStack()
    
    func saveRequestToken(requestToken: String) {
        keyChainStack.saveValue(key: Keys.requestTokenKey.rawValue, value: requestToken)
    }
    
    func getRequestToken() -> String? {
        return keyChainStack.getValue(key: Keys.requestTokenKey.rawValue)
    }
    
    func saveSessionID(sessionID: String) {
        keyChainStack.saveValue(key: Keys.sessionIDKey.rawValue, value: sessionID)
    }
    
    func getSessionID() -> String? {
        return keyChainStack.getValue(key: Keys.sessionIDKey.rawValue)
    }
    
    func saveExpirationDate(date: String) {
        keyChainStack.saveValue(key: Keys.expirationDate.rawValue, value: date)
    }
    
    func getExpirationDate() -> String? {
        return keyChainStack.getValue(key: Keys.expirationDate.rawValue)
    }
    
    func savePassword(password: String) {
        keyChainStack.saveValue(key: Keys.password.rawValue, value: password)
    }
    
    func getPassword() -> String? {
        return keyChainStack.getValue(key: Keys.password.rawValue)
    }
    
    func saveUserName(userName: String) {
        keyChainStack.saveValue(key: Keys.userName.rawValue, value: userName)
    }
    
    func getUserName() -> String? {
        return keyChainStack.getValue(key: Keys.userName.rawValue)
    }
    
    func clearAll() {
        keyChainStack.clearAll()
    }
    

}
