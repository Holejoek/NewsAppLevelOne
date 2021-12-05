//
//  ArticlesViewController.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 05.12.2021.
//

import UIKit

class ArticlesViewController: UIViewController {

    @IBOutlet weak var articlesCollectionView: UICollectionView!
    
    var articles = [Article]()
    let viewModel = ArticlesViewModel()
    var sourceId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        articlesCollectionView.register(UINib(nibName: "ArticlesTableCollectionCell", bundle: nil), forCellWithReuseIdentifier: "ArticlesTableCollectionCell")
        viewModel.getAtriclesFromSource(sourceId: sourceId)
        viewModel.articles.bind { [weak self] articles in
            self?.articles = articles
            self?.articlesCollectionView.reloadData()
        }
    }
    init(sourceId: String) {
        super.init(nibName: nil, bundle: nil)
        self.sourceId = sourceId
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ArticlesViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AriclesTableCollectionCell", for: indexPath) as! AriclesTableCollectionCell
        cell.setupCell(articles: articles)
        return cell
    }
    
    
}
