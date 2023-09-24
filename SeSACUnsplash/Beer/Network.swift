//
//  Network.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/25.
//

import Foundation
import Alamofire

final class Network {
    
    static let shared = Network()
    private init() { }
    
    func callRequest<T: Decodable>(type: T.Type, api: BeerRouter, completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(api).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
