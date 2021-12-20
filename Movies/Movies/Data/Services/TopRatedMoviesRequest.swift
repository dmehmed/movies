//
//  TopRatedMoviesRequest.swift
//  Movies
//
//  Created by Deniz Mehmed on 20.12.21.
//

import Foundation

public class TopRatedMoviesRequest: Request {
    
    public typealias successType = MovieList
    
    public var method = "GET"
    public var url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=87c18a6eca3e6995e82fab7f60b9a8a7")!
    
}
