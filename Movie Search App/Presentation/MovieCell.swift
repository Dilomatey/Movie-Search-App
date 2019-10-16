//
//  MovieCell.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import UIKit

class MovieCell : UITableViewCell {
    var mainView = MovieView()
    var posterUrl = String()
    var movie : Details! {
        didSet {
            populateCell()
        }
    }
    
    override func layoutSubviews() {
        self.selectionStyle = .none
        self.backgroundColor = .init(240, 240, 240)
        contentView.addSubview(mainView)
        mainView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height - 5)
    }
    private func populateCell() {
        self.mainView.moviePoster.image = nil
        self.mainView.movieTitle.text = movie.title
        self.mainView.movieDetail.text = movie.overview
        if let posterPath = movie.posterPath {
            self.mainView.moviePoster.getCachedImages(URL.init(string: posterUrl+posterPath))
        }
    }
}
