//
//  NetworkManager.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 07/02/24.
//

import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getAppetizer(page: Int, completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        if(page > 10) {
            return
        }
        
        var urlString: String = "https://script.google.com/macros/s/AKfycbwqZr0C-x5thQQ0hKlRejNpoFUJa8lv3aSAGSFBjj8fcDjnPithV2OAI-bDQDCNor0yWg/exec"
        urlString.append("?page=\(page)&pageSize=10")
        
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data,response, error in
            if let _ = error {
                completed(.failure(.unknownError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                
                completed(.failure(.invalidData))
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode([Appetizer].self, from: data)
                completed(.success(decodedData))
                return
                
            } catch {
                completed(.failure(.invalidData))
            }
            
            
        }
        task.resume()
        
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
        
        let cacheKey = NSString(string: urlString)
        
        if let img = cache.object(forKey: cacheKey) {
            completed(img)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
