//
//  ProfileDetailsServiceImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

class ProfileDetailsServiceImplementation {
    var apiManager : APIManager
    
    init(apiManager: APIManager = DefaultAPI()) {
        self.apiManager = apiManager
    }
}

extension ProfileDetailsServiceImplementation  : ProfileDetailsService {
    
    func requestProfileDetails(completion: @escaping (Result<ProfileDetailsDTO, any Error>) -> Void) {
        self.apiManager.initRequest(with: ProfileRequest.requestDetails, type: ProfileDetailsDTO.self) { result  in
            switch result {
            case .success(let profileDetailsDTO):
                completion(.success(profileDetailsDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
