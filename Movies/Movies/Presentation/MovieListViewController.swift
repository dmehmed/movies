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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let movieListService = MovieListService()
        let movieListRepository = PopularMoviesRepository(movieListService)
        let movieListUseCase = FetchPopularMoviesUseCase(movieListRepository)
        self.movieListViewModel = MoviewListViewModel(movieListUseCase, delegate: self)
        
        self.movieListViewModel?.loadPopularMovies()
        
    }
    
    func refreshList(_ movieList: MovieList?) {
        // adapter reload data
    }
    
}

