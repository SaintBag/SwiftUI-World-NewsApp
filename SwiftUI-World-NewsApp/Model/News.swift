//
//  News.swift
//  SwiftUI-World-NewsApp
//
//  Created by Sebastian on 17/01/2023.
//

import Foundation

struct News: Codable {
    let articles: [Article]
}

struct Article: Codable, Identifiable {
    
    var id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let description: String?
    let image: String?
//  let date: Date()
    
    enum CodingKeys: String, CodingKey {
        case author
        case url
        case source
        case title
        case description
        case image
//      case date
    }

}

extension Article {
    
    static var fakeNews: Article {
        .init(author: "Kotinkova",
              url: "https://www.cnn.com/2023/01/15/asia/nepal-yeti-airlines-crash-intl-hnk/index.html",
              source: "CNN",
              title: "At least 68 killed in Nepal's worst airplane crash in 30 years - CNN",
              description: "At least 68 people were killed Sunday when an aircraft went down near the city of Pokhara in central Nepal, a government official said, the country's deadliest plane crash in more than 30 years.",
              image: "https://media.cnn.com/api/v1/images/stellar/prod/230115050553-02-pokhara-plane-crash-011523.jpg?c=16x9&q=w_800,c_fill")
//              date: Date())
    }
}
