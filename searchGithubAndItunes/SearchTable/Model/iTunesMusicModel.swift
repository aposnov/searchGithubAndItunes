//
//  iTunesMusicModel.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

class iTunesMusicModel {

    var artistName: String
    var trackName: String
    var picSmall: String
    var picBig: String
    
    init?(dict: [String: AnyObject]) {
        
        let artistName = dict["artistName"] as? String
        let trackName = dict["trackName"] as? String
        let picSmall = dict["artworkUrl60"] as? String
        let picBig = dict["artworkUrl100"] as? String
        
        self.artistName = artistName!
        if (trackName != nil){
        self.trackName = trackName!
        }else{
       self.trackName = "Нет информации"
        }
        self.picSmall = picSmall!
        self.picBig = picBig!
    }
    
}


