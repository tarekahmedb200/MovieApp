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
        
        ZStack {
            
            ScrollView {
                
                Spacer()
                
                Image("homeImage")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width / 2,height:  UIScreen.main.bounds.width / 2)
                
                Text("Movie App")
                    .foregroundStyle(.white)
                    .fontDesign(.rounded)
                    .font(.title)
                
                VStack {
                    createField(placeHolder: "Enter UserName", isPassword: false, value: $viewModel.userName)
                    
                    createField(placeHolder: "Enter Password", isPassword: true, value: $viewModel.password)
                    
                    Button(action: {
                        dismissKeyboard()
                        viewModel.authenticate()
                    }, label: {
                        Text("Login")
                            .foregroundStyle(.white)
                            .bold()
                            .frame(width: UIScreen.main.bounds.width / 2,height: 50)
                            .background(LinearGradient(colors: [.red,.purple], startPoint: .leading, endPoint: .trailing))
                            .clipShape(Capsule())
                    })
                    .padding(.vertical)
                    
                }
                .padding(.vertical)
                .background(Color(red: 31.0/255, green: 32.0/255, blue: 50.0/255,opacity: 1))
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                .padding()
                
                Spacer()
                
            }
            
            if viewModel.isLoading {
                LoadingToastView()
                    .frame(width: 300,height: 100)
                    .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
            }
            
        }
        .onAppear(perform: {
            viewModel.checkUserSignedBefore()
        })
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
    }
    
    @ViewBuilder
    func createField(placeHolder:String,isPassword:Bool,value:Binding<String>) -> some View {
        VStack(alignment:.center,spacing:0) {
            Group {
                if !isPassword {
                    TextField("", text: $viewModel.userName,prompt: Text(placeHolder).foregroundColor(.white))
                }else {
                    SecureField("", text: $viewModel.password,prompt: Text(placeHolder).foregroundColor(.white))
                }
            }
            .textInputAutocapitalization(.never)
            .padding()
            .frame(height: 60)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            
            Divider()
                .background(.white)
                .padding(.horizontal)
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}



