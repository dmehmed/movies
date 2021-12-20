//
//  ViewController.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import UIKit

class MovieListViewController: UIViewController, MovieListViewModelDelegate {
    
    static let BUTTON_CORNER_RADIUS: CGFloat = 10
    
    // collection
    @IBOutlet var popularMoviesButton: UIButton!
    @IBOutlet var topRatedMoviesButton: UIButton!
    
    @IBOutlet var movieListTableView: UITableView!
    
    private var movieListViewModel: MovieListViewModelProtocol?
    private var movieListTableViewAdapter: MovieListTableView?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupButtons()
        
        self.movieListTableViewAdapter = MovieListTableViewAdapter(movieListTableView)
        
        let movieListService = MovieListService()
        let movieListRepository = DefaultMovieListRepository(movieListService)
        
        let popularMovieListUseCase = FetchPopularMoviesUseCase(movieListRepository)
        let topRatedMovieListUseCase = FetchTopRatedMoviesUseCase(movieListRepository)
        
        self.movieListViewModel = MovieListViewModel([popularMovieListUseCase, topRatedMovieListUseCase],
                                                     delegate: self)
        
        self.didPressPopularMoviesButton(popularMoviesButton!)
        
    }
    
    func refreshList(_ movies: [MovieListItemViewModel]) {
        self.movieListTableViewAdapter?.reload(movies)
    }
    
    // MARK: - IBActions
    @IBAction func didPressPopularMoviesButton(_ sender: Any) {
        
        self.deselectButtons()
        
        self.popularMoviesButton.isSelected = true
        self.movieListViewModel?.loadPopularMovies()
        
    }
    
    @IBAction func didPressTopRatedMoviesButton(_ sender: Any) {
        
        self.deselectButtons()
        
        self.topRatedMoviesButton.isSelected = true
        self.movieListViewModel?.loadTopRatedMovies()
        
    }
    
}

extension MovieListViewController {
    
    private func setupButtons() {
        self.popularMoviesButton.layer.cornerRadius = MovieListViewController.BUTTON_CORNER_RADIUS
        self.topRatedMoviesButton.layer.cornerRadius = MovieListViewController.BUTTON_CORNER_RADIUS
    }
    
    private func deselectButtons() {
        self.popularMoviesButton.isSelected = false
        self.topRatedMoviesButton.isSelected = false
    }
    
}
