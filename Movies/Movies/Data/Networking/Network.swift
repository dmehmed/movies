//
//  Network.swift
//  Movies
//
//  Created by Deniz Mehmed on 15.12.21.
//

import Foundation

public class Network {
    
    public func perform<RequestType: Request>(_ request: RequestType, with completion: @escaping (MovieList?) -> Void) {
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: request.url)) { data, response, error in
            
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
