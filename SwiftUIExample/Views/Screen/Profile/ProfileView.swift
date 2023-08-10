//
//  ProfileView.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import SwiftUI

struct ProfileView: View {

    @ObservedObject var loginViewModel = LoginViewModel()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Text("Login").font(.largeTitle).padding()
                Text("Please enter your detail to login").font(.subheadline)
                
                TextField("Email", text: $loginViewModel.logindataModel.userEmail)
                    .cornerRadius(6)
                    .keyboardType(.emailAddress)
                    .padding(6)
                
                SecureField("Password", text: $loginViewModel.logindataModel.userPassword)
                    .cornerRadius(6)
                    .padding(6)
                
                HStack {
                    NavigationLink(destination: UserListView(), isActive: $loginViewModel.logindataModel.isNavigate) {
                        Button("Login") {
                            if(loginViewModel.validateUserInput()) {
                                loginViewModel.authenticateUser()
                            }
                        }
                    }.alert(isPresented: $loginViewModel.logindataModel.isPresentingErrorAlert) {
                        Alert(title: Text("Alert"),message: Text(loginViewModel.logindataModel.errorMsg),dismissButton: .cancel(Text("OK")))
                    }

                    Spacer()
                    Button("Forgot Password") {
                        debugPrint("Forgot Tap")
                    }
                    
                }.padding()
            }
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
