//
//  TableViewCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 30.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(source: Source) {
        sourceLabel.text = source.name
        descriptionLabel.text = source.description
    }
    
}
