//
//  User.swift
//  SwiftUIExample
//
//  Created by Neosoft on 08/08/23.
//

import Foundation

class User: ObservableObject{
    @Published var name : String = String()
}

class Account: ObservableObject {
    @Published var accountBalance: Double = 0.0
}
