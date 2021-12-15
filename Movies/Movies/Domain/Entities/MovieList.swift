//
//  MovieList.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public struct MovieList {
    
    let page: Int?
    let totalPages: Int?
    let totalResults: Int?
    let results: [Movie]?
    
}

extension MovieList: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case page
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results
    }
    
}
