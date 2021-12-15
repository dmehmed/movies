//
//  Network.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public class Network {
    
    private var baseURL = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=87c18a6eca3e6995e82fab7f60b9a8a7")
    
    public func perform(with completion: @escaping (MovieList?) -> Void) {
//        let task1 = URLSession.shared.datata
        let task = URLSession.shared.dataTask(with: self.baseURL!) { data, response, error in
            
            guard let data = data else {
                
                DispatchQueue.main.async {
                    // TODO: - Must return error
                    completion(nil)
                }
                return
                
            }
            
            let wrapper = try? JSONDecoder().decode(MovieList.self, from: data)
            
            DispatchQueue.main.async {
                completion(wrapper)
            }
            
            // do { ...^ } catch { completion with error }
            
        }
        
        task.resume()
        
    }
    
}
