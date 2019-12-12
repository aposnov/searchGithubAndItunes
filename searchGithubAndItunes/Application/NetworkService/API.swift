//
//  API.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 13.12.2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

struct API {
    enum Content: String {
        case iTunesTracks = "https://itunes.apple.com/search?media=music&term="
        case gutHubUsers = "https://api.github.com/search/users?q="
    }
}
