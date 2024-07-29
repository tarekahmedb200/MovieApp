//
//  LoginViewFactory.swift
//  MovieApp
//
//  Created by tarek ahmed on 29/07/2024.
//

import Foundation

class LoginViewFactory {
    
    private var loginCoordinator : LoginCoordinator
    
    init(loginCoordinator: LoginCoordinator) {
        self.loginCoordinator = loginCoordinator
    }
    
    func getLoginView() -> LoginView {
        return LoginView(viewModel: self.getLoginViewModel())
    }
    
    private func getLoginViewModel() -> LoginViewModel {
        return LoginViewModel(authenticateUseCase: getAuthenticateUseCase(), loginCoordinator: self.loginCoordinator)
    }
    
    private func getAuthenticateUseCase() -> AuthenticateUseCase {
        return AuthenticateUseCaseImplementation(authenticationRepository: getAuthenticateRepository())
    }
    
    private func getAuthenticateRepository() -> AuthenticationRepository {
      return DefaultAuthenticationImplentationRepository(authenticationService: DefaultAuthenticationImplementation(), appInfoStorage: KeyChainImplementation())
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

