//
//  LoginViewModel.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import Foundation

struct LoginDataModel {
    var userEmail: String = String()
    var userPassword: String = String()
    var errorMsg: String = String()
    var isNavigate: Bool = false
    var isPresentingErrorAlert: Bool = false
}

class LoginViewModel: ObservableObject {
    
    @Published var logindataModel: LoginDataModel = LoginDataModel()
    private let loginValidation = LoginValidation()
    private let loginResourse = LoginResource()
    
    func validateUserInput() -> Bool {
        
        let result = loginValidation.validateUserInputs(userEmail: logindataModel.userEmail, userPassword: logindataModel.userPassword)
        if !result.success {
            logindataModel.errorMsg = result.errorMessage ?? "error occured"
            logindataModel.isPresentingErrorAlert = true
        }
        return true
    }
    
    func authenticateUser() {
        let loginRequest = LoginRequest(userEmail: logindataModel.userEmail, userPassword: logindataModel.userPassword)
        loginResourse.authenticate(loginRequest: loginRequest) {[weak self] result in
            DispatchQueue.main.async {
                if result?.errorMessage == nil {
                    self?.logindataModel.isNavigate = true
                }else {
                    self?.logindataModel.errorMsg = result?.errorMessage ?? "error occurred"
                    self?.logindataModel.isPresentingErrorAlert = true
                }
            }
        }
    }
}
