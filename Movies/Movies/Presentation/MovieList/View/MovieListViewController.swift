//
//  ViewController.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import UIKit

class MovieListViewController: UIViewController, MovieListViewModelDelegate {
    
    @IBOutlet weak var movieListTableView: UITableView!
    
    private var movieListViewModel: MovieListViewModelProtocol?
    private var movieListTableViewAdapter: MovieListTableView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        movieListTableViewAdapter = MovieListTableViewAdapter(movieListTableView)
        
        let movieListService = MovieListService()
        let movieListRepository = PopularMoviesRepository(movieListService)
        let movieListUseCase = FetchPopularMoviesUseCase(movieListRepository)
        self.movieListViewModel = MovieListViewModel(movieListUseCase, delegate: self)
        
        self.movieListViewModel?.loadPopularMovies()
        
    }
    
    func refreshList(_ movies: [MovieListItemViewModel]) {
        movieListTableViewAdapter?.reload(movies)
    }
    
}

