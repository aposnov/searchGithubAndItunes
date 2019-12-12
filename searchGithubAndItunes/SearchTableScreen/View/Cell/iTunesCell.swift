//
//  iTunesCell.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import UIKit

class iTunesCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet private weak var author: UILabel!
    @IBOutlet private weak var name: UILabel!
    
    func configure(with track: iTunesMusicModel) {
        self.author.text = track.artistName
        self.name.text = track.trackName
        self.icon.load(url: URL(string: track.artworkUrl100)!)
    }
    
    func configure(with gitHubUser: GitHubModel) {
        self.author.text = gitHubUser.login
        self.name.text =  gitHubUser.html_url
        self.icon.load(url: URL(string: gitHubUser.avatar_url)!)
    }

}
