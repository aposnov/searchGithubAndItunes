//
//  GitHubModel.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 27/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

struct GitHubModelResponse: Decodable {
    var items: [GitHubModel]
}

struct GitHubModel: Decodable {
    var avatar_url: String
    var login: String
    var html_url: String
}
