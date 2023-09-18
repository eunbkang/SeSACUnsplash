//
//  APIService.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/12.
//

import Foundation

class APIService {
    
    static let shared = APIService()
    private init() { }
    
    private let header = [
        "Authorization": "Client-ID \(APIKey.unsplash)"
    ]
    
    func callRequest<T: Codable>(url: URL, model: T.Type, completion: @escaping (T?) -> ()) {
        var request = URLRequest(url: url, timeoutInterval: 10)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = header
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error {
                    print(error)
                    completion(nil)
                }
                
                guard let httpResponse = response as? HTTPURLResponse, (200...500).contains(httpResponse.statusCode) else {
                    print(error)
                    completion(nil)
                    return
                }
                
                guard let data else {
                    completion(nil)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result)
                } catch {
                    print(error)
                    completion(nil)
                }
            }
        }.resume()
    }
}
