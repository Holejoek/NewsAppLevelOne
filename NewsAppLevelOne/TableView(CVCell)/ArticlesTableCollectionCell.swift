//
//  SourcesTableCollectionCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 30.11.2021.
//

import UIKit

class AriclesTableCollectionCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: - Проблема: Нижняя ячейка не не влазит в tableView
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 140, right: 0)  // Хотелось бы найти альтернативу этому решению
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "ArticleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTableViewCell")
    }
    
    func setupCell(articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }
    
}

extension AriclesTableCollectionCell: UITableViewDataSource, UITableViewDelegate {
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
