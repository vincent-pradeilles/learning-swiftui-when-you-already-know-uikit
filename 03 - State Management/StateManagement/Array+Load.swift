//
//  Array+Load.swift
//  Swift UI State Management
//
//  Created by Vincent on 30/08/2021.
//

import Foundation

extension Array where Element: Decodable {
    static func fromJSON(named fileName: String) throws -> [Element] {
        guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Couldn't find \(fileName).json in main bundle.")
        }
        
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Couldn't decode \(fileName).json from main bundle.")
        }
        
        let decoder = JSONDecoder()
        
        do {
            return try decoder.decode([Element].self, from: data)
        } catch {
            fatalError("Couldn't decode \(fileName).json from main bundle.\n\(error)")
        }
    }
}
