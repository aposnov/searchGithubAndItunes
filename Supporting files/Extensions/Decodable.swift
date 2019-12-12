//
//  Decodable.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 12.12.2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
    
    static func decodeArray(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> [Self] {
         return try decoder.decode([Self].self, from: data)
     }
}
