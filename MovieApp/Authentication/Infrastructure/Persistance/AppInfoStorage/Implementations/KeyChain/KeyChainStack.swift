//
//  KeyChainStack.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation
import KeychainSwift

class KeyChainStack {
    
    private let keychain = KeychainSwift()
    
    func saveValue(key : String,value:String) {
        keychain.set(value, forKey: key)
    }
    
    func getValue(key:String) -> String? {
        return keychain.get(key)
    }
    
    func clearAll() {
        keychain.clear()
    }

}
