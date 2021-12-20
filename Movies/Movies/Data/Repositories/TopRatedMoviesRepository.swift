//
//  TopRatedMoviesRepository.swift
//  Movies
//
//  Created by Deniz Mehmed on 17.12.21.
//

import Foundation

public class TopRatedMoviesRepository: MovieListRepository {
    
    private let service: MovieListServiceProtocol
    
    public init(_ service: MovieListServiceProtocol) {
        self.service = service
    }
    
    public func fetchTopRatedMovies(_ completion: @escaping (MovieList?) -> Void) {
        self.service.getTopRatedMovies { result in
            completion(result)
        }
    }
    
    public func fetchPopularMovies(_ completion: @escaping (MovieList?) -> Void) { }
    
}
