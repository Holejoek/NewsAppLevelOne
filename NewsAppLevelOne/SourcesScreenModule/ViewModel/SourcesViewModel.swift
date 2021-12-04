//
//  ViewModel.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 02.12.2021.
//

import Foundation


class SourcesViewModel {
    
    let networkService = NetworkService()
    var sources = Box([Source]())
    let failureSources = [Source(id: "", name: "Not Found", description: "Not Found", url: "", category: "", language: "", country: "")]
    func updateSources() {
        sources = Box([Source]())
        networkService.getSources { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
            switch result {
            case .success(let sources):
                self.sources.value = sources?.sources
            case .failure(let error):
                self.sources.value = self.failureSources
                print("View Model Switch ERROR \(error)")
            }
            }
        }
    }
}
