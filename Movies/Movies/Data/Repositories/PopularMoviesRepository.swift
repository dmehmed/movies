//
//  PopularMoviesRepository.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public class PopularMoviesRepository: MovieListRepository {
    
    private let service: MovieListServiceProtocol
    
    public init(_ service: MovieListServiceProtocol) {
        self.service = service
    }
    
    public func fetchPopularMovies(_ completion: @escaping (MovieList?) -> Void) {
        
        self.service.getPopularMovies { result in
            print(result)
            // parse func in this file filter etc funcs
            
            completion(result)
        }
        
    }
    
    // MARK: - Refactor
    public func fetchTopRatedMovies(_ completion: @escaping (MovieList?) -> Void) { }
    
}
