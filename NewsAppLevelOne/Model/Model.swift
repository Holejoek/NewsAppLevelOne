//
//  Model.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 29.11.2021.
//

import Foundation


// MARK: - Sources
struct NewsSourcesData: Codable {
    var status: String
    var sources: [Source]
}
// MARK: - Source
struct Source: Codable {
    let id: String
    let name: String
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
}


// MARK: - Articles
struct NewsArticlesData: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?

}




