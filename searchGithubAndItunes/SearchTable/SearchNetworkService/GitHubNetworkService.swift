//
//  GitHubNetworkService.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class GitHubNetworkService{
    private init() {}
    
    static func getGitHub(q: String, completion: @escaping(GitHubResponse) -> ()){
        guard let url = URL(string: "https://api.github.com/search/users?q="+q) else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            
            do {
                let response = try GitHubResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
            
        }
    }
}
