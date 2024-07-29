//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import Foundation

class LoginViewModel : ObservableObject {
    
    @Published  var userName : String = ""
    @Published  var password : String = ""
    @Published  var errorMessage : String = ""
    @Published  var showAlert : Bool = false
    
    private var authenticateUseCase : AuthenticateUseCase
    private var loginCoordinator : LoginCoordinator
    
    init(authenticateUseCase: AuthenticateUseCase, loginCoordinator: LoginCoordinator) {
        self.authenticateUseCase = authenticateUseCase
        self.loginCoordinator = loginCoordinator
    }
    
    func authenticate() {
        
        self.authenticateUseCase.execute(userName: userName, password: password) { [weak self] result in
            DispatchQueue.main.async { [weak self] in
                
                guard let weakSelf = self else { return }
                switch result {
                case .success(let isLoginSuccess):
                    if isLoginSuccess {
                        self?.presentHomeScreen()
                    }else {
                        self?.errorMessage = "Unknow Error"
                        self?.showAlert = true
                    }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.showAlert = true
                }
            }
        }
    }
    
    private func presentHomeScreen() {
        loginCoordinator.present(fullScreenCover: .homeScreen)
    }
    
    
}
