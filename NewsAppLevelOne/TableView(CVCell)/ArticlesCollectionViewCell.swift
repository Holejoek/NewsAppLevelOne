//
//  ArticlesCollectionViewCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 05.12.2021.
//

import UIKit

class ArticlesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    
    var articles = [Article]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
    }
    
    func setupCell(articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }
    
}

extension ArticlesCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        let article = articles[indexPath.row]
        cell.setupCell(article: article )
        return cell
    }
  
}

