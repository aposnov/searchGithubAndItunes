//
//  iTunesMusicModel.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation


struct iTunesMusicModelResponse: Decodable {
    var resultCount: Int
    var results: [iTunesMusicModel]
}

struct iTunesMusicModel: Decodable {
    var artistName: String
    var trackName: String
    var artworkUrl60: String
    var artworkUrl100: String
}



