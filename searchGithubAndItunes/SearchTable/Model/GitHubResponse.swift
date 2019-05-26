//
//  GitHubResponse.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class GitHubResponse {
     let gitHubFromSrv: [GitHubModel]
    
    init(json: Any) throws {
        
        typealias JSON = [String: Any]
        typealias JSONtunes = [[String: AnyObject]]
        
        guard let array = json as? JSON else { throw NetworkError.failInternerError }
        guard let arrayOfResults = array["items"] as? JSONtunes else { throw NetworkError.failInternerError }
        
        print(arrayOfResults)
        
        var gitHubFromSrv = [GitHubModel]()
        for dictioanary in arrayOfResults {
            guard let githubUser = GitHubModel(dict: dictioanary) else { continue }
            gitHubFromSrv.append(githubUser)
        }

        self.gitHubFromSrv = gitHubFromSrv
        
    }
}
