//
//  iTunesNetworkService.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class iTunesNetworkService{
    private init() {}
    
    static func getItunes(q: String, completion: @escaping(iTunesMusicModelResponse) -> Void){
        guard let url = URL(string: "https://itunes.apple.com/search?media=music&term="+q) else { return }
        NetworkService.shared.getData(url: url) { (json) in
            do {
                let response = try iTunesMusicModelResponse.decode(from: json as! Data)
                completion(response)
            } catch {
                print(error)
            }
            
        }
    }
}
