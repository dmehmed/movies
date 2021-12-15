//
//  FetchPopularMoviesUseCase.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public protocol FetchMoviesUseCase {
    func execute(_ completion: @escaping (MovieList?) -> Void)
}

public struct FetchPopularMoviesUseCase: FetchMoviesUseCase {
    
    private let repository: MovieListRepository
    
    public init(_ repository: MovieListRepository) {
        self.repository = repository
    }
    
    public func execute(_ completion: @escaping (MovieList?) -> Void) {
        self.repository.fetchPopularMovies(completion)
    }
    
}
