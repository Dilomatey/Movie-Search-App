//
//  MovieSearchViewController.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import UIKit

class MovieSearchViewController: UITableViewController {
    let cellId = "movieCell"
    let dataSource = MovieDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupTable()
        self.tableView.register(MovieCell.self, forCellReuseIdentifier: cellId)
        dataSource.cellId = cellId
        dataSource.gotData = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

private extension MovieSearchViewController {
    func setupNav() {
        //setup navigationbar & searchbar
        let imageView = UIImageView()
        imageView.image = UIImage.init(imageCatalogue: .twitter)?.withRenderingMode(.alwaysOriginal)
        navigationItem.titleView = imageView
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a movie"
        search.searchBar.backgroundColor = .white
        search.searchBar.delegate = self
        navigationItem.searchController = search
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.barTintColor = UIColor.init(29, 202, 255)
    }
    
    func setupTable() {
        //Setup tableview
        tableView.estimatedRowHeight = 200
        tableView.tintColor = .clear
        tableView.separatorStyle = .none
        tableView.dataSource = dataSource
    }
}

extension MovieSearchViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            self.dataSource.movieName = text
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dataSource.movies = nil
        dataSource.gotData?()
    }
}
