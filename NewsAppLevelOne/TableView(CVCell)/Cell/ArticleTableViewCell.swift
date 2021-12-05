//
//  TableViewCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 30.11.2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    
    @IBOutlet var sourceNameLabel: UILabel!
    
   
    @IBOutlet var articleContentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(article: Article) {
        sourceNameLabel.text = article.source.name
        articleContentLabel.text = article.content
    }
    
}
