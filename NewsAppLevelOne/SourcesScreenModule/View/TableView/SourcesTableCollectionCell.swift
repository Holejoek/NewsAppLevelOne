//
//  SourcesTableCollectionCell.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 30.11.2021.
//

import UIKit

class SourcesTableCollectionCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    
    var sources = [Source]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: - Проблема: Нижняя ячейка не не влазит в tableView
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)  // Хотелось бы найти альтернативу
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func setupCell(sources: [Source]) {
        self.sources = sources
        tableView.reloadData()
    }
    
}

extension SourcesTableCollectionCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sources.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let source = sources[indexPath.row]
        cell.setupCell(source: source)
        
        return cell
    }
  
}
