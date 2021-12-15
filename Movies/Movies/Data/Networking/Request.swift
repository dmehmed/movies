//
//  Request.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public protocol Request {
    
    associatedtype successType: Decodable
    
    var method: String { get set }
    var url: URL { get set }
    
}
