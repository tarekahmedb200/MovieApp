//
//  LogoutService.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

protocol LogoutService {
    func logout(logoutRequest: LogoutRequestDTO,completion: @escaping (Result<LogoutResponseDTO, any Error>) -> Void)
}
