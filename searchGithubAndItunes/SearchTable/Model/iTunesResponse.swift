//
//  iTunesResponse.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class iTunesResponse {
    let itunesFromSrv: [iTunesMusicModel]
    
    init(json: Any) throws {
        
        typealias JSON = [String: Any]
        typealias JSONtunes = [[String: AnyObject]]
        
        guard let array = json as? JSON else { throw NetworkError.failInternerError }
        guard let arrayOfResults = array["results"] as? JSONtunes else { throw NetworkError.failInternerError }
        
        //print(array)
        
        var itunesFromSrv = [iTunesMusicModel]()
        for dictioanary in arrayOfResults {
            guard let track = iTunesMusicModel(dict: dictioanary) else { continue }
            itunesFromSrv.append(track)
        }

        self.itunesFromSrv = itunesFromSrv
        
    }
}
