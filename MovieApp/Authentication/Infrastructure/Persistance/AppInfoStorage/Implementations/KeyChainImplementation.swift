//
//  KeyChainImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation
import KeychainSwift

class KeyChainImplementation : AppInfoStorage {
    
    enum Keys : String {
        case requestTokenKey = "token"
        case sessionIDKey = "session"
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
    
    
}
