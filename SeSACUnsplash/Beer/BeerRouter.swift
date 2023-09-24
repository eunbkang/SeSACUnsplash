//
//  BeerRouter.swift
//  SeSACUnsplash
//
//  Created by Eunbee Kang on 2023/09/25.
//

import Foundation
import Alamofire

enum BeerRouter: URLRequestConvertible {

    case multiple
    case single(id: Int)
    case random
    
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/")!
    }
    
    private var path: String {
        switch self {
        case .multiple:
            return "beers"
        case .single(let id):
            return "beers/\(id)"
        case .random:
            return "beers/random"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let request = URLRequest(url: url)
        
        return request
    }
}
