//
//  ViewController.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var sourceType = 0
    
    @IBAction func chooseSource(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            sourceType = 0
            print(sourceType)
//            historyView.isHidden = true
//            popularView.isHidden = false
        case 1:
//            historyView.isHidden = false
//            popularView.isHidden = true
            sourceType = 1
            print(sourceType)
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "iTunesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "iTunesCell")
        
       
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesCell", for: indexPath) as! iTunesCell
        
        cell.author.text = "John"
        cell.name.text = "Hello world"
        return cell
    }
    
    


}

