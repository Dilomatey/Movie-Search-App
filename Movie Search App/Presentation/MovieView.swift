//
//  ViewModels.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import UIKit

class MovieView : UIView {
    
    let moviePoster = UIImageView()
    let movieTitle = UILabel()
    let movieDetail = UILabel()
    override func layoutSubviews() {
        self.backgroundColor = .white
        self.addSubview(moviePoster)
        self.addSubview(movieTitle)
        self.addSubview(movieDetail)
        
        self.moviePoster.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: nil, bottom: self.bottomAnchor, padding: .zero, size: .init(width: 120, height: 200))
        self.moviePoster.setupView()
        
        self.movieTitle.anchor(top: nil, leading: self.moviePoster.trailingAnchor, trailing: self.trailingAnchor, bottom: self.movieDetail.topAnchor, padding: .init(top: 20, left: 10, bottom: 0, right: -10), size: .init(width: 0, height: 40))
        self.movieTitle.setupLabel(font: .systemFont(ofSize: 16), color: .lightGray)
        
        self.movieDetail.anchor(top: self.movieTitle.bottomAnchor, leading: self.moviePoster.trailingAnchor, trailing: self.trailingAnchor, bottom: self.bottomAnchor, padding: .init(top: 20, left: 10, bottom: -10, right: -10), size: .init(width: 0, height: 120))
        self.movieDetail.setupLabel(font: .boldSystemFont(ofSize: 13), color: .darkGray)
    }
}


