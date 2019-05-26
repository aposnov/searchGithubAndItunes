//
//  ViewController.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var sourceType = 0
    
    var itunesFromSrv = [iTunesMusicModel]()
    
    @IBAction func chooseSource(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            sourceType = 0
            print(sourceType)

        case 1:
            itunesFromSrv.removeAll()
            tableView.reloadData()
            searchBar.text = ""
            sourceType = 1
        default:
            break;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "iTunesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "iTunesCell")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        if sourceType == 0 {
            DispatchQueue.main.async {
                iTunesNetworkService.getItunes(q: searchText) {(response) in
                    
                    self.itunesFromSrv = response.itunesFromSrv
                    
                    self.tableView.reloadData()
                    
                } // конец network service
                
            } //конец dispatch
        } else if sourceType == 1 {
            
            print(searchText)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itunesFromSrv.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //проверка на четное-нечетное
        if indexPath.row % 2 == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesCell", for: indexPath) as! iTunesCell
            let track = itunesFromSrv[indexPath.row]
            cell.configure(with: track)
            return cell
        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesCell2", for: indexPath) as! iTunesCell
            let track = itunesFromSrv[indexPath.row]
            cell.configure(with: track)
            return cell
        }
        
      
    }
    
    


}


