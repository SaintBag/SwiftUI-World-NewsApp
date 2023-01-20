//
//  APIService.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import Foundation

enum NewsError: LocalizedError {
    case invalidUrl
    case invalidStatusCode(statusCode: Int)
    case invalidData
    case failedToDecode(error: Error)
    
    
    private var errorDescription: String {
        switch self {
        case .invalidUrl:
            return "URL isn't valid"
        case .invalidStatusCode:
            return "Status code falls into the wrong range"
        case .invalidData:
            return "Response data is invalid"
        case .failedToDecode:
            return "Failed to decode"
        }
    }
}

protocol NewsFetchableProtocol {
    func fetchNews(completion: @escaping (Result<News, NewsError>) -> Void)
}

final class ApiService: NewsFetchableProtocol {
    func fetchNews(completion: @escaping (Result<News, NewsError>) -> Void) {
        
        guard let url = URL(string: "https://api.lil.software/news") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
           
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode >= 400 {
                    completion(.failure(.invalidStatusCode(statusCode: httpResponse.statusCode)))
                    print(httpResponse.statusCode)
                    return
                }
            }
            do {
                let articles = try JSONDecoder().decode(News.self, from: data)
                completion(.success(articles))
            } catch {
                print(String(data: data, encoding: .utf8) as Any)
                print(error)
                completion(.failure(.failedToDecode(error: error)))
            }
        }.resume()
    }
}

final class NewsViewModel: ObservableObject {
    
    @Published var articles: [Article] = []
    private let apiService: NewsFetchableProtocol
    
    init(apiService: NewsFetchableProtocol) {
        self.apiService = apiService
    }
    
    func fetchNews() {
        
        ApiService().fetchNews { result  in
            switch result {
                
            case .success(let articles):
                DispatchQueue.main.async {
                    self.articles = articles.articles
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

