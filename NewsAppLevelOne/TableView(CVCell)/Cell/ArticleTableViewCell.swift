//
//  ArticleTableViewCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 05.12.2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

//    let source: Source
//    let author: String?         ?
//    let title: String?          -
//    let description: String?    -
//    let url: String?
//    let urlToImage: String?     ?
//    let publishedAt: String?    ?
//    let content: String?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(article: Article){
        self.titleLabel.text = article.title
        self.descriptionLabel.text = article.description
//        let myImageView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.frame.width, height: self.frame.width)))
       let backgroundImage = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.frame.width, height: self.frame.width)))
        backgroundImage.center = self.center
        backgroundImage.image = UIImage(named: "1")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.clipsToBounds = true 
//        backgroundImage.clipsToBounds
        backgroundImage.alpha = 0.2
        self.backgroundView = backgroundImage
        self.backgroundView?.sizeThatFits(CGSize(width: self.frame.width, height: self.frame.width))
//        self.addSubview(backgroundImage)
    }
}
