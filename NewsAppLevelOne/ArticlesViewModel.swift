//
//  ArticlesViewModel.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 05.12.2021.
//

import Foundation

class ArticlesViewModel {
    
    let networkService = NetworkService()
    let articles = Box([Article]())
    func getAtriclesFromSource(sourceId: String){
        networkService.getSourceArticles(sourceId: sourceId) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self.articles.value = articles?.articles
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
    
}
