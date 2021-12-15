//
//  PopularMoviesRequest.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public class PopularMoviesRequest: Request {
    
    public typealias successType = MovieList
    
    public var method = "GET"
    public var url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=87c18a6eca3e6995e82fab7f60b9a8a7")!
    
}
