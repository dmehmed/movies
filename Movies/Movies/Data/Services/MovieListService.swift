//
//  MovieListService.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public protocol MovieListServiceProtocol {
    func getPopularMovies(_ completion: @escaping (MovieList?) -> Void)
    func getTopRatedMovies(_ completion: @escaping (MovieList?) -> Void)
}

public class MovieListService: Service, MovieListServiceProtocol {
    
    public func getPopularMovies(_ completion: @escaping (MovieList?) -> Void) {
        network.perform(PopularMoviesRequest(), with: completion)
    }
    
    public func getTopRatedMovies(_ completion: @escaping (MovieList?) -> Void) {
        network.perform(TopRatedMoviesRequest(), with: completion)
    }
    
}
