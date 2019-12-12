//
//  ViewController.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import UIKit

class SearchTableViewController: UIViewController {
    
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    private var sourceType = 0
    
    private var itunesFromSrv = [iTunesMusicModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    private var gitHubFromSrv = [GitHubModel]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func chooseSource(_ sender: Any) {
        self.searchBar.text = ""
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            self.gitHubFromSrv.removeAll()
            sourceType = 0
        case 1:
            self.itunesFromSrv.removeAll()
            sourceType = 1
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableViewCells()
    }
    
    private func setupTableViewCells() {
        var nib = UINib(nibName: "iTunesCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "iTunesCell")
              
        nib = UINib(nibName: "iTunesCell2", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "iTunesCell2")
    }
    
   private func imageTapped(image:UIImage) {
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
    
     func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.endEditing(true)
    }
    
}

extension SearchTableViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if self.sourceType == 0 {
            iTunesNetworkService.getItunes(q: searchText) { [weak self] (response) in
                guard let self = self else { return }
                self.itunesFromSrv.removeAll()
                for itunesTrack in response.results {
                    self.itunesFromSrv.append(itunesTrack)
                }
            } // конец network service
        } else if self.sourceType == 1 {
            GitHubNetworkService.getGitHub(q: searchText) { [weak self] (response) in
                guard let self = self else { return }
                self.gitHubFromSrv.removeAll()
                for gitHubUser in response.items {
                    self.gitHubFromSrv.append(gitHubUser)
                }
            } // конец network service
        }
    }
    
}

extension SearchTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sourceType == 0 ? self.itunesFromSrv.count : self.gitHubFromSrv.count
    }
       
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.sourceType == 0 {
            //проверка на четное-нечетное
            let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.row % 2 == 0 ? "iTunesCell" : "iTunesCell2", for: indexPath) as! iTunesCell
            let track = itunesFromSrv[indexPath.row]
            cell.configure(with: track)
            return cell
        } else {
           //проверка на четное-нечетное
            let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.row % 2 == 0 ? "iTunesCell2" : "iTunesCell", for: indexPath) as! iTunesCell
            let gitHubUsr = gitHubFromSrv[indexPath.row]
            cell.configure(with: gitHubUsr)
            return cell
       }
    }
       
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! iTunesCell
        if let cellImage = cell.icon.image {
            self.imageTapped(image: cellImage)
        }
    }
}
