//
//  ArticlesViewController.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 05.12.2021.
//

import UIKit

class ArticlesViewController: UIViewController {

    @IBOutlet weak var articlesCollectionView: UICollectionView!
    
    var articles = [Article](){
        didSet{
                self.articlesCollectionView.reloadData()
        }
    }
    let viewModel = ArticlesViewModel()
    var sourceId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false  
        articlesCollectionView.backgroundColor = .blue
        articlesCollectionView.register(UINib(nibName: "ArticlesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ArticlesCollectionViewCell")
        articlesCollectionView.dataSource = self
        articlesCollectionView.delegate = self
            self.viewModel.getAtriclesFromSource(sourceId: self.sourceId)
        viewModel.articles.bind { [weak self] articles in
            self?.articles = articles
        }
    }
   
}

extension ArticlesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArticlesCollectionViewCell", for: indexPath) as! ArticlesCollectionViewCell
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = cell.center
        cell.addSubview(activityIndicator)
        if articles.isEmpty {
            activityIndicator.startAnimating()
            
        } else {
            activityIndicator.stopAnimating()
        }
        cell.setupCell(articles: articles)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: articlesCollectionView.frame.height)
    }
    
    
}
