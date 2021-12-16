//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Deniz Mehmed on 16.12.21.
//

import Foundation

public protocol MovieListViewModelDelegate {
    func refreshList(_ movieList: MovieList?)
}

// TO DO: is it needed?
public protocol MovieListViewModelProtocol {
    func getPopularMovies()
}

public struct MoviewListViewModel: MovieListViewModelProtocol {
    
    private let useCase: FetchPopularMoviesUseCase
    private let delegate: MovieListViewModelDelegate
    
    public init(_ useCase: FetchPopularMoviesUseCase, delegate: MovieListViewModelDelegate) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func getPopularMovies() {
        
        self.useCase.execute { data in
            self.delegate.refreshList(data)
        }
        
    }
    
}
