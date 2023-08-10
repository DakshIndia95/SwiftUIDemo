//
//  Landmark.swift
//  SwiftUIExample
//
//  Created by Neosoft on 08/08/23.
//

import Foundation

struct City : Decodable {
    let cityId: Int
    let name: String
    let landmarks: [Landmark]
}

struct Landmark : Decodable {
    let landmarkId : Int
    let name, photo, description: String
}


