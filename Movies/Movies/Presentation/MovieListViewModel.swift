//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Deniz Mehmed on 16.12.21.
//

import Foundation

public protocol MovieListViewModelProtocol {
    func refreshList(_ movieList: MovieList?)
}

public struct MoviewListViewModel {
    
    private let useCase: FetchPopularMoviesUseCase
    private let delegate: MovieListViewModelProtocol
    
    public init(_ useCase: FetchPopularMoviesUseCase, delegate: MovieListViewModelProtocol) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func loadPopularMovies() {
        
        self.useCase.execute { data in
            self.delegate.refreshList(data)
        }
        
    }
    
}
