//
//  FetchMoviesUseCase.swift
//  Movies
//
//  Created by Deniz Mehmed on 17.12.21.
//

import Foundation

public protocol FetchMoviesUseCase {
    func execute(_ completion: @escaping (MovieList?) -> Void)
}
