//
//  ViewModel.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 02.12.2021.
//

import Foundation
import UIKit

typealias SourceInfo = (id: String, name: String, description: String)
class SourcesViewModel {
    
    let networkService = NetworkService()
    var sources = Box([Source]())
    let failureSources = [Source(id: "", name: "Not Found", description: "Not Found", url: "", category: "", language: "", country: "")]
    func updateSources() {
        networkService.getSources { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let sources):
                    self.sources.value = sources?.sources
                case .failure(let error):
                    self.sources.value = self.failureSources
                    print(error)
                }
            }
        }
    }
    func goNextScreen(sourceId: String, nav: UINavigationController) {
        let articlesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ArticlesViewController") as! ArticlesViewController
        articlesVC.sourceId = sourceId
        nav.pushViewController(articlesVC, animated: true)
    }
}
