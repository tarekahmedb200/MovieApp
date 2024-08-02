//
//  ApiManager.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

public protocol APIManager {
    func initRequest<T: Decodable>(with data: APIRequest,type: T.Type, completion : @escaping (Result<T, Error>) -> Void)
}
