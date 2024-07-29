//
//  AppInfoStorage.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation

protocol AppInfoStorage {
    func saveRequestToken(requestToken:String)
    func getRequestToken() -> String?
    func saveSessionID(sessionID:String)
    func getSessionID() -> String?
}
