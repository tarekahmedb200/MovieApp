//
//  ProfileFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

class ProfileFactory {
    
    private var profileCoordinator : ProfileCoordinator
    
    init(profileCoordinator: ProfileCoordinator) {
        self.profileCoordinator = profileCoordinator
    }
    
    func getProfileView() -> ProfileView {
        return ProfileView(viewModel: self.getProfileViewModel())
    }
    
    private func getProfileViewModel() -> ProfileViewModel {
        return ProfileViewModel(logoutUseCase: getLogoutUseCase(), profileDetailsUseCase: getProfileDetailsUseCase(), profileCoordinator: self.profileCoordinator)
    }
    

    private func getProfileDetailsUseCase() -> ProfileDetailsUseCase {
        return ProfileDetailsUseCaseImplementation(profileDetailsRepository: getProfileDetailsRepository())
    }
    
    private func getProfileDetailsRepository() -> ProfileDetailsRepository {
        return ProfileDetailsRepositoryImplementation(profileDetailsService: ProfileDetailsServiceImplementation())
    }
    
    private func getLogoutUseCase() -> LogoutUseCase {
        return LogoutUseCaseImplementation(LogoutRepository: getLogoutRepository())
    }
    
    private func getLogoutRepository() -> LogoutRepository {
        return LogoutRepositoryImplementation(logoutService: LogoutServiceImplementation(), appInfoStorage: KeyChainImplementation())
    }

   
    
}
