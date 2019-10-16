//
//  Movies.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import Foundation


struct Movies : Codable {
    let results : [Details]?
}

struct Details : Codable {
    let title : String?
    let overview : String?
    let posterPath : String?
    
    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath 
    }
}
