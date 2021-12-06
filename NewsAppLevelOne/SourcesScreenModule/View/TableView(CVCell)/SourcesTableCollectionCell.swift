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
    var vc: SourceScreenViewController!
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func setupCell(sources: [Source], vc: SourceScreenViewController) {
        self.sources = sources
        tableView.reloadData()
        self.vc = vc
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
        let sourceId = self.sources[indexPath.row].id
        vc.goNextScreen(sourceId: sourceId)
    }
}
