//
//  GitHubModel.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 27/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class GitHubModel {

    var avatar_url: String
    var login: String
    var html_url: String
    
    init?(dict: [String: AnyObject]) {
        
        let avatar_url = dict["avatar_url"] as? String
        let login = dict["login"] as? String
        let html_url = dict["html_url"] as? String
        
        self.avatar_url = avatar_url!
        self.login = login!
        self.html_url = html_url!
    }
    
}
