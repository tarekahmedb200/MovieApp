//
//  ProfileDetailsUseCaseImplementation.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

final class ProfileDetailsUseCaseImplementation {
    
    private let profileDetailsRepository: ProfileDetailsRepository
    
    init(profileDetailsRepository: ProfileDetailsRepository) {
        self.profileDetailsRepository = profileDetailsRepository
    }
}

extension ProfileDetailsUseCaseImplementation: ProfileDetailsUseCase {
    func execute(completion: @escaping (Result<ProfileDetailsDTO, any Error>) -> Void) {
        self.profileDetailsRepository.requestProfileDetails { result in
            switch result {
            case .success(let profileDetailsDto):
                completion(.success(profileDetailsDto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

