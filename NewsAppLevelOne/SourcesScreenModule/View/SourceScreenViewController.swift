//
//  ViewController.swift
//  NewsAppLevelOne
//
//  Created by Иван Тиминский on 29.11.2021.
//

import UIKit

class SourceScreenViewController: UIViewController {

    @IBOutlet weak var sourcesCollectionView: UICollectionView!  // Из Main Storyboard
    
   
    private let viewModel = SourcesViewModel()
    var sources = [Source]() {
        didSet {
            sourcesCollectionView.reloadSections(IndexSet(integer: 1))
        }
    }
   
    var copyOfSources = [Source]()   // Создано для реализации поиска источников
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavController()
        setupCollectiionView()
        viewModel.updateSources()
        viewModel.sources.bind { [weak self] sources in
            guard let self = self else { return }
            self.sources = sources
            self.copyOfSources = sources
            self.sourcesCollectionView.reloadData()
        }
    }
    private func setupCollectiionView() {
        sourcesCollectionView.isScrollEnabled = false
        sourcesCollectionView.register(UINib(nibName: "SourcesTableCollectionCell", bundle: nil), forCellWithReuseIdentifier: "SourcesTableCollectionCell")
        sourcesCollectionView.dataSource = self
        sourcesCollectionView.delegate = self
    }
    private func setupNavController() {
        self.navigationController?.navigationItem.title = "Sources"
        self.navigationController?.navigationBar.isHidden = false
    }
}

//MARK: CollectionViewSetup
extension SourceScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 { return 0 }  //  в первой секции находится header с searchBar
        else { return 1 }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SourcesTableCollectionCell", for: IndexPath(item: 0, section: 1)) as! SourcesTableCollectionCell
        cell.setupCell(sources: sources)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height)
    }
    
    
    
    // MARK: - SearchBar
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
        let searchView: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchBar", for: IndexPath(item: 0, section: 0))
        return searchView
        }
        let empty: UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SearchBar", for: IndexPath(item: 0, section: 1))  // без deque нельзя создать UICollectionReusableView() пустой экземляр и передать его в return 
        empty.isHidden = true
        return empty
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 { return CGSize.zero }
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    
   
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sources = copyOfSources.filter({ source in
            source.name.lowercased().contains(searchText.lowercased())
        })
        if searchText.isEmpty {
            sources = copyOfSources
        }
    }
}


