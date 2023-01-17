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

struct Article: Codable {
    
    let author: String?
    let url: String?
    let source: String?
    let title: String?
    let description: String?
    let image: String?
    let date: Date?
    
}

