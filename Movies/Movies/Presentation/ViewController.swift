//
//  ViewController.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let movieListService = MovieListService()
        let movieListRepository = PopularMoviesRepository(movieListService)
        let movieListUseCase = FetchPopularMoviesUseCase(movieListRepository)
        // to do view model with use case, stored property
        
        
    }


}

