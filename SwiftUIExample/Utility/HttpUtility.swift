//
//  HttpUtility.swift
//  SwiftUIExample
//
//  Created by Neosoft on 09/08/23.
//

import Foundation

enum ApiError: Error {
    case invalidUrl
    case invalidData
    case invalidResponse
}

final class HttpUtility {
    
    static let shared = HttpUtility()
    private init(){}

    func postData<T:Decodable>(request: URLRequest, resultType:T.Type, completionHandler:@escaping(_ reuslt: T?)-> Void) {

        URLSession.shared.dataTask(with: request) { data, response, error in
            if(error == nil && data != nil) {
                let response = try? JSONDecoder().decode(resultType.self, from: data!)
                _ = completionHandler(response)
            }
        }.resume()
    }
}
