//
//  Movie.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public struct Movie {
    
    let id: Int?
    let title: String?
    let releaseDate: String?
    
}


extension Movie: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
    }
    
}
