//
//  MovieListRepository.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public protocol MovieListRepository {
    func fetchPopularMovies(_ completion: @escaping (MovieList?) -> Void)
}
