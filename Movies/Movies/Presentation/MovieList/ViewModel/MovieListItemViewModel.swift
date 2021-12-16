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
    let posterPath: String?
    
    public init(_ movie: Movie) {
        
        self.title = movie.title ?? ""
        self.posterPath = movie.posterPath
        
        if let releaseDate = movie.releaseDate {
            self.releaseDate = "Release date: \(releaseDate)"
        } else {
            self.releaseDate = "To be announced..."
        }
        
    }
    
}
