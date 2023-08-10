//
//  JsonParser.swift
//  SwiftUIExample
//
//  Created by Neosoft on 08/08/23.
//

import Foundation

struct JSONHelper {
    static func loadCityJsonDataFromFile() -> [City] {
        guard let url = Bundle.main.url(forResource: "City", withExtension: "json") else { return [] }
        guard let data = try? Data(contentsOf: url) else { return [] }
        guard let jsonData = try? JSONDecoder().decode([City].self, from: data) else { return []
        }
        return jsonData
    }
    
    static func loadCricketerJsonDataFromFile() -> [Cricketer] {
        guard let url = Bundle.main.url(forResource: "Cricketer", withExtension: "json") else { return [] }
        guard let data = try? Data(contentsOf: url) else { return [] }
        guard let jsonData = try? JSONDecoder().decode([Cricketer].self, from: data) else { return []
        }
        return jsonData
    }
}
