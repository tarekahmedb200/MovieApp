//
//  LogoutUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

protocol LogoutUseCase {
    func execute(completion: @escaping (Result<Bool,Error>) -> Void)
}
