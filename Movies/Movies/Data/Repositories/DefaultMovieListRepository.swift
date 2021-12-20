//
//  DefaultMovieListRepository.swift
//  Movies
//
//  Created by Deniz Mehmed on 20.12.21.
//

import Foundation

public class DefaultMovieListRepository: MovieListRepository {
    
    private let service: MovieListService
    
    public init(_ service: MovieListService) {
        self.service = service
    }
    
    public func fetchPopularMovies(_ completion: @escaping (MovieList?) -> Void) {
        
        self.service.getPopularMovies { result in
            print(result)
            // parse func in this file filter etc funcs
            completion(result)
        }
        
    }
    
    public func fetchTopRatedMovies(_ completion: @escaping (MovieList?) -> Void) {
        
        self.service.getTopRatedMovies { result in
            completion(result)
        }
        
    }
    
}
