//
//  LoginInfoRepository.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

protocol LoginValidationRepository {
    func getPassword() -> String?
    func getUserName() -> String?
    func getExpirationDate() -> String?
}
