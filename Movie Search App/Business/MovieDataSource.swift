//
//  MovieDataSource.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import UIKit


class MovieDataSource : NSObject, UITableViewDataSource {
    
    var movies : Movies?
    var movieName : String = "" {
        didSet {
            self.movieName = self.movieName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
            fetchMovie()
        }
    }
    var gotData : (() -> ())?
    var cellId = String()
    let posterUrl = "https://image.tmdb.org/t/p/w600_and_h900_bestv2"
    let urlString = "https://api.themoviedb.org/3/search/movie?api_key=2a61185ef6a27f400fd92820ad9e8537&query="
    
    // Make API call for movies
    func fetchMovie() {
        let decoder = JSONDecoder()
        decoder.decode(Movies.self, urlString+movieName) { movies in
            self.movies = movies
            self.gotData?()
        }
    }
    
    // Tableview Datasource implementation
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MovieCell
        cell.posterUrl = posterUrl
        cell.movie = self.movies!.results![indexPath.row]
        return cell
    }
    
}
