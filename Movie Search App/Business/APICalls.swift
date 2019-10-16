//
//  APICalls.swift
//  Movie Search App
//
//  Created by Samuel Kudadji on 9/30/19.
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import Foundation

public func makeAPICall(_ url: URL, completion: @escaping (Data) -> ()) {
    DispatchQueue.global(qos: .default).async {
    let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
        if let data = data {
            completion(data)
        }
    }
    task.resume()
    }
}
