//
//  MovieViewModel.swift
//  Movies
//
//  Created by Deniz Mehmed on 16.12.21.
//

import Foundation

public struct MovieListItemViewModel {
    
    let title: String
    let releaseDate: String
    
    public init(_ movie: Movie) {
        self.title = movie.title ?? ""
        self.releaseDate = movie.releaseDate ?? ""
    }
    
}
