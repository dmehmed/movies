//
//  MovieListItemTableViewCell.swift
//  Movies
//
//  Created by Deniz Mehmed on 16.12.21.
//

import Foundation
import UIKit

public class MovieListItemTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: MovieListItemTableViewCell.self)
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    
    private var viewModel: MovieListItemViewModel!
    
    public func populate(with viewModel: MovieListItemViewModel) {
        
        self.viewModel = viewModel
        
        self.titleLabel.text = viewModel.title
        self.releaseDateLabel.text = viewModel.title
        
        self.updatePoster()
        
    }
    
    private func updatePoster() {
        
        self.posterImageView.image = nil
        
        // MARK: - Refactor this logic !
        if let posterURL = URL(string: self.viewModel.posterPath ?? ""),
           let posterImage = try? UIImage(data: Data(contentsOf: posterURL)) {
            self.posterImageView.image = posterImage
        }
        
    }
    
}
