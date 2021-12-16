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
}

public struct MovieListViewModel: MovieListViewModelProtocol {
    
    private let useCase: FetchPopularMoviesUseCase
    private let delegate: MovieListViewModelDelegate
    
    public init(_ useCase: FetchPopularMoviesUseCase, delegate: MovieListViewModelDelegate) {
        self.useCase = useCase
        self.delegate = delegate
    }
    
    public func loadPopularMovies() {
        
        self.useCase.execute { data in
            
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
