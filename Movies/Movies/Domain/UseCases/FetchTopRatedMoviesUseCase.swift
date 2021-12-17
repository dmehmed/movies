//
//  FetchTopRatedMoviesUseCase.swift
//  Movies
//
//  Created by Deniz Mehmed on 17.12.21.
//

import Foundation

public struct FetchTopRatedMoviesUseCase: FetchMoviesUseCase {
    
    private let repository: MovieListRepository
    
    public init(_ repository: MovieListRepository) {
        self.repository = repository
    }
    
    public func execute(_ completion: @escaping (MovieList?) -> Void) {
        self.repository.fetchTopRatedMovies(completion)
    }
    
}
