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
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with track: iTunesMusicModel) {
        self.author.text = track.artistName
        self.name.text = track.trackName
        self.icon.load(url: URL(string: track.picSmall)!)
    }

    

}
