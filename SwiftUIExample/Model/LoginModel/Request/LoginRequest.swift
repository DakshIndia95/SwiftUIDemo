//
//  LoginRequest.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail, userPassword: String
}
