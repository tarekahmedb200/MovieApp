//
//  LoginValidatationUseCase.swift
//  MovieApp
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation


protocol LoginValidatationUseCase {
    func execute(completion: @escaping (Bool) -> Void)
}
