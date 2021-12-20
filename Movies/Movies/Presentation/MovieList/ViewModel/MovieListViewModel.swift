//
//  MovieListViewModel.swift
//  Movies
//
//  Created by Deniz Mehmed on 16.12.21.
//

import Foundation

public protocol MovieListViewModelDelegate {
    func refreshList(_ movies: [MovieListItemViewModel])
}

public protocol MovieListViewModelProtocol {
    func loadPopularMovies()
    func loadTopRatedMovies()
}

public struct MovieListViewModel: MovieListViewModelProtocol {
    
    private let useCases: [FetchMoviesUseCase]
    private let delegate: MovieListViewModelDelegate
    
    public init(_ useCases: [FetchMoviesUseCase], delegate: MovieListViewModelDelegate) {
        self.useCases = useCases
        self.delegate = delegate
    }
    
    public func loadPopularMovies() {
        
        self.useCases.first?.execute { data in
            
            guard let movies = self.getMovieListItemViewModels(from: data) else {
                return
            }
            
            self.delegate.refreshList(movies)
            
        }
        
    }
    
    public func loadTopRatedMovies() {
        
        self.useCases.last?.execute { data in
            
            guard let movies = self.getMovieListItemViewModels(from: data) else {
                return
            }
            
            self.delegate.refreshList(movies)
            
        }
        
    }
    
    private func getMovieListItemViewModels(from data: MovieList?) -> [MovieListItemViewModel]? {
        data?.results?.compactMap(MovieListItemViewModel.init)
    }
    
}
