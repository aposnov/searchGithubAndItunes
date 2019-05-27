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
    var gitHubFromSrv = [GitHubModel]()
    
    @IBAction func chooseSource(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            gitHubFromSrv.removeAll()
            tableView.reloadData()
            searchBar.text = ""
            sourceType = 0
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
        
        var nib = UINib(nibName: "iTunesCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "iTunesCell")
        
         nib = UINib(nibName: "iTunesCell2", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "iTunesCell2")
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
            DispatchQueue.main.async {
                GitHubNetworkService.getGitHub(q: searchText) {(response) in
                    
                    self.gitHubFromSrv = response.gitHubFromSrv
                    
                    self.tableView.reloadData()
                    
                } // конец network service
                
            } //конец dispatch
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if sourceType == 0 {
        return itunesFromSrv.count
         } else {
        return gitHubFromSrv.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if sourceType == 0 {
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
      
        } else {
       
            //проверка на четное-нечетное
            if indexPath.row % 2 == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesCell2", for: indexPath) as! iTunesCell
                let gitHubUsr = gitHubFromSrv[indexPath.row]
                cell.configure(with: gitHubUsr)
                return cell
                } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesCell", for: indexPath) as! iTunesCell
                let gitHubUsr = gitHubFromSrv[indexPath.row]
                cell.configure(with: gitHubUsr)
                return cell
            }
    
        }
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! iTunesCell
        self.imageTapped(image: cell.icon.image!)
    }
    
    func imageTapped(image:UIImage){
        let newImageView = UIImageView(image: image)
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(SearchTableViewController.dismissFullscreenImage(_:)))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
  
        self.searchBar.endEditing(true)
    }


}


