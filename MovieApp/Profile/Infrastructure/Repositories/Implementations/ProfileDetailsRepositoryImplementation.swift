//
//  ProfileDetailsRepositoryImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

class ProfileDetailsRepositoryImplementation {
    
    private var profileDetailsService: ProfileDetailsService
    
    init(profileDetailsService: ProfileDetailsService) {
        self.profileDetailsService = profileDetailsService
    }
}

extension ProfileDetailsRepositoryImplementation : ProfileDetailsRepository {
    
    func requestProfileDetails(completion: @escaping (Result<ProfileDetailsDTO, any Error>) -> Void) {
        self.profileDetailsService.requestProfileDetails { result in
            switch result {
            case .success(let profileDetailsDTO):
                completion(.success(profileDetailsDTO))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    
    
    
    
}
