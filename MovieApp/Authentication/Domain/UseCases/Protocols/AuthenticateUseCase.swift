//
//  AuthenticateUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 28/07/2024.
//

import Foundation


protocol AuthenticateUseCase {
    func execute(userName: String, password: String, completion: @escaping (Result<Bool,Error>) -> Void) 
}
 
