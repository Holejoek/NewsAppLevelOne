//
//  ViewController.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sourcesCollectionView: UICollectionView!  // Из Main Storyboard
    
   
    private let viewModel = SourcesViewModel()
    var sources = [Source]() {
        didSet {
            sourcesCollectionView.reloadData()
        }
    }
    var copyOfSources = [Source]()   // Создано для реализации поиска источников
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sourcesCollectionView.isScrollEnabled = false
        sourcesCollectionView.register(UINib(nibName: "SourcesTableCollectionCell", bundle: nil), forCellWithReuseIdentifier: "SourcesTableCollectionCell")
        sourcesCollectionView.dataSource = self
        sourcesCollectionView.delegate = self
        viewModel.updateSources()
        viewModel.sources.bind { [weak self] sources in
            guard let self = self else { return }
            self.sources = sources
            self.copyOfSources = sources
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SourcesTableCollectionCell", for: indexPath) as! SourcesTableCollectionCell
        cell.setupCell(sources: sources)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
    }
    
    // MARK: - SearchBar
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchBar", for: indexPath)
        return searchView
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.sources.removeAll()
        for source in copyOfSources {
            if source.name.lowercased().contains(searchBar.text!.lowercased()) {
                self.sources.append(source)
            }
        }
        if searchBar.text!.isEmpty {
            sources = copyOfSources
        }
        self.sourcesCollectionView.reloadData()
    }
    
   
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        self.sources.removeAll()
//        for source in copyOfSources {
//            if source.name.lowercased().contains(searchText.lowercased()) {
//                self.sources.append(source)
//
//            }
//        }
//
//        if searchBar.text!.isEmpty {
//            sources = copyOfSources
//        }
//
//
//
//        searchBar.searchTextField.becomeFirstResponder()
//        (searchBar.superview as! SearchBarView).searchBar.becomeFirstResponder()
//         self.sourcesCollectionView.reloadData()
//    }
}


