//
//  APIService.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import Foundation

protocol URLBuilder {
    var baseUrl: URL { get }
    var path: String { get }
    var urlRequest: URLRequest { get }
}

enum URLPathEndpoint {
    case getNews
}

extension URLPathEndpoint: URLBuilder {
    var baseUrl: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
        
    }
    
    var path: String {
        return "/news"
    }
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseUrl.appendingPathExtension(self.path))
    }
}


