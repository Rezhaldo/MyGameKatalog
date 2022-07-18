//
//  DetailModel.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 14/07/22.
//

import Foundation

struct DetailResponse: Codable {
    let id: Int
    let nameOriginal: String
    let description: String
    let descriptionRaw: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameOriginal = "name_original"
        case description
        case descriptionRaw = "description_raw"
    }
}
