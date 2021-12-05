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
    let navController: UINavigationController!
    override func awakeFromNib() {
        super.awakeFromNib()
        //MARK: - Проблема: Нижняя ячейка не не влазит в tableView
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 140, right: 0)  // Хотелось бы найти альтернативу этому решению
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func setupCell(sources: [Source], nav: UINavigationController) {
        self.sources = sources
        tableView.reloadData()
        self.navController = 
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
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
