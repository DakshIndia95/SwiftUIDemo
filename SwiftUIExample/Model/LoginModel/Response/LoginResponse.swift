//
//  LoginResponse.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import Foundation

struct LoginResponse: Decodable {
    let errorMessage: String?
    let data: LoginResponseData?
}

struct LoginResponseData : Decodable {
    let userName, email: String
    let userId: Int
}
