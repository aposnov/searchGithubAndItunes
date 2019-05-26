//
//  GitHubResponse.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class GitHubResponse {
//    let gitHub: [GitHubServerModel]
    
    init(json: Any) throws {
        
        typealias JSON = [String: Any]
        
        guard let array = json as? JSON else { throw NetworkError.failInternerError }
        
        print (array)
        
    }
}
