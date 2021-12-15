//
//  MovieListService.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public protocol MovieListServiceProtocol {
    func getPopularMovies(_ completion: @escaping (MovieList?) -> Void)
}

public class MovieListService: Service, MovieListServiceProtocol {
    
    public func getPopularMovies(_ completion: @escaping (MovieList?) -> Void) {
        // TODO: - request, perform request with compl
    }
    
}
