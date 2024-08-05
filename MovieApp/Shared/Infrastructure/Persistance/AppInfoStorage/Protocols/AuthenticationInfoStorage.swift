//
//  AppInfoStorage.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation

protocol AuthenticationInfoStorage {
    func saveRequestToken(requestToken:String)
    func getRequestToken() -> String?
    func saveSessionID(sessionID:String)
    func getSessionID() -> String?
    func saveExpirationDate(date:String)
    func getExpirationDate() -> String?
    func savePassword(password:String)
    func getPassword() -> String?
    func saveUserName(userName:String)
    func getUserName() -> String?
    func clearAll()
}
