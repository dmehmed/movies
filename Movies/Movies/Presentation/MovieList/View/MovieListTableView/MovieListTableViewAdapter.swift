//
//  MovieListTableViewAdapter.swift
//  Movies
//
//  Created by Deniz Mehmed on 16.12.21.
//

import Foundation
import UIKit

public protocol MovieListTableView {
    func reload(_ movies: [MovieListItemViewModel])
}

public class MovieListTableViewAdapter: NSObject, MovieListTableView {
    
    private var tableView: UITableView
    private var movies: [MovieListItemViewModel] = []
    
    public init(_ tableView: UITableView) {
        
        self.tableView = tableView
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: MovieListItemTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: MovieListItemTableViewCell.reuseIdentifier)
        
    }
    
    public func reload(_ movies: [MovieListItemViewModel]) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
}

extension MovieListTableViewAdapter: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: MovieListItemTableViewCell.reuseIdentifier, for: indexPath) as! MovieListItemTableViewCell
        
        cell.populate(with: movies[indexPath.row])
        
        return cell
        
    }
    
}
