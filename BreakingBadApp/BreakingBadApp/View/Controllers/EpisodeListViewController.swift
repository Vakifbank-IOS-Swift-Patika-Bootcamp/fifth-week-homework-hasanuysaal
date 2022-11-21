//
//  EpisodeListViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

class EpisodeListViewController: UIViewController {
    
    @IBOutlet weak var episodeListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateTableView()
        registerTableViewCell()
        
    }

    func delegateTableView(){
        episodeListTableView.delegate = self
        episodeListTableView.dataSource = self
    }
    
    func registerTableViewCell(){
        episodeListTableView.register(UINib(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

}

extension EpisodeListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = episodeListTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? EpisodesTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(name: "Episode Name", season: "3")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}
