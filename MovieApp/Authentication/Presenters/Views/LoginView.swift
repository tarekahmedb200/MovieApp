//
//  ContentView.swift
//  MovieApp
//
//  Created by tarek ahmed on 27/07/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        
        ScrollView {
            
            Image("homeImage")
                .resizable()
                .frame(width: UIScreen.main.bounds.width / 2,height:  UIScreen.main.bounds.width / 2)
            
            Text("Movie App")
                .font(.title)
            
            createField(placeHolder: "Enter Email", isPassword: false, value: $viewModel.userName)
            
            createField(placeHolder: "Enter Password", isPassword: true, value: $viewModel.password)
            
            
            Button(action: {
                dismissKeyboard()
                viewModel.authenticate()
            }, label: {
                Text("Login")
                    .frame(width: UIScreen.main.bounds.width - 20,height: 50)
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .padding(.top,20)
                
            })
            
            Spacer()
            
        }
        .alert(viewModel.errorMessage, isPresented: $viewModel.showAlert) {
                    Button("OK", role: .cancel) { }
        }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                
                Spacer()
                
                Button("Done") {
                    dismissKeyboard()
                }
            }
        }
        .padding()
    }
    
    @ViewBuilder
    func createField(placeHolder:String,isPassword:Bool,value:Binding<String>) -> some View {
        VStack(alignment:.center,spacing:0) {
            Group {
                if !isPassword {
                    TextField(placeHolder, text: $viewModel.userName)
                }else {
                    SecureField(placeHolder, text: $viewModel.password)
                }
            }
            .textInputAutocapitalization(.never)
            .padding()
            .frame(height: 60)
            .foregroundStyle(.black)
            .clipShape(Capsule())
            
            
            Divider()
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    
    
    
}

#Preview {
    LoginView(viewModel: LoginViewModel(authenticateUseCase: AuthenticateUseCaseImplementation(authenticationRepository: DefaultAuthenticationImplentationRepository(authenticationService: DefaultAuthenticationImplementation(), appInfoStorage: KeyChainImplementation())), loginCoordinator: LoginCoordinator()))
}
