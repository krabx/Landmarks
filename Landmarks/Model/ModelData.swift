//
//  ModelData.swift
//  Landmarks
//
//  Created by Богдан Радченко on 23.04.2023.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    let hikes: [Hike] = load("hikeData.json")
    @Published var profile = Profile.default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ fileName: String) -> T {
//    let data: Data
    
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
    else {
        fatalError("Couldn't find \(fileName) in main bundle.")
    }
    
    let decoder = JSONDecoder()
    
    do {
        let data = try decoder.decode(T.self, from: Data(contentsOf: file))
        return data
    } catch {
        fatalError("Couldn't load \(fileName) from main bundle:\n\(error) or Couldn't parse \(fileName) as \(T.self)")
    }
//    do {
//        data = try Data(contentsOf: file)
//    } catch {
//        fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
//    }
//
//    do {
//        let decode = JSONDecoder()
//        return try decode.decode(T.self, from: data)
//    } catch {
//        fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
//    }
}
