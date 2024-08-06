//
//  ProfileViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 05/08/2024.
//

import Foundation

class ProfileViewModel : ObservableObject {
    
    @Published var errorMessage : String = ""
    @Published var showAlert : Bool = false
    @Published private var profileDetailsDTO : ProfileDetailsDTO?
    
    private var logoutUseCase: LogoutUseCase
    private var profileDetailsUseCase : ProfileDetailsUseCase
    private var profileCoordinator : ProfileCoordinator
    
    init(logoutUseCase: LogoutUseCase, profileDetailsUseCase: ProfileDetailsUseCase, profileCoordinator: ProfileCoordinator) {
        self.logoutUseCase = logoutUseCase
        self.profileDetailsUseCase = profileDetailsUseCase
        self.profileCoordinator = profileCoordinator
    }
    
    func LoadProfileDetails() {
        self.profileDetailsUseCase.execute { result in
            switch result {
            case .success(let profileDetailsDto):
                DispatchQueue.main.async { [weak self] in
                    self?.profileDetailsDTO = profileDetailsDto
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func logout() {
        self.logoutUseCase.execute { result in
            switch result {
            case .success(let isLoggedOut):
                DispatchQueue.main.async { [weak self] in
                    if isLoggedOut {
                        self?.profileCoordinator.dismiss()
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async { [weak self] in
                    self?.errorMessage = error.localizedDescription
                }
                
            }
        }
    }
    
    func navigateToWatchList() {
        profileCoordinator.push(page: .watchList)
    }
    
}


extension ProfileViewModel {
    var profileUserName : String {
        return profileDetailsDTO?.username ?? ""
    }
    
    var posterPathUrl : URL? {
        return profileDetailsDTO?.posterPathUrl
    }
}
