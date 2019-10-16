//
//  JSONExtension.swift
//  Movie Search App
//  Copyright © 2019 Samuel Kudadji. All rights reserved.
//

import Foundation

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, _ urlString: String, completion: @escaping (T) -> ()) {
        makeAPICall(URL.init(string:urlString)!) { data in
            do {
                self.dateDecodingStrategy = .iso8601
                self.keyDecodingStrategy = .convertFromSnakeCase
                let movieData = try self.decode(type, from: data)
                completion(movieData)
            }
            catch let err {
                print(err.localizedDescription)
            }
        }
    }
}
