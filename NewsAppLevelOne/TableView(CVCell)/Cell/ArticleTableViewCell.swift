//
//  ArticleTableViewCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 05.12.2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publishedDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBackgroundOfCell()
    }

    private let dateFormatter: DateFormatter = {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MM.dd 'в' HH:mm "
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 10800)
      return dateFormatter
    }()
    
    
    func setupCell(article: Article){
        self.titleLabel.text = article.title
        self.publishedDateLabel.text = dateFormatter.string(from: article.convertDate)
    }
    private func setupBackgroundOfCell() {
        let backgroundImage = UIImageView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: self.frame.width, height: self.frame.width)))
         backgroundImage.center = self.center
         backgroundImage.image = UIImage(named: "1")
         backgroundImage.contentMode = .scaleAspectFill
         backgroundImage.clipsToBounds = true
         backgroundImage.alpha = 0.2
         self.backgroundView = backgroundImage
    }
}
