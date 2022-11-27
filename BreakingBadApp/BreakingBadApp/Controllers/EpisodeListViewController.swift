//
//  EpisodeListViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class EpisodeListViewController: BaseViewController {
    
    @IBOutlet private weak var episodeListTableView: UITableView!
    
    private var episodes: [Episode]? {
        didSet{
            episodeListTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateTableView()
        registerTableViewCell()
        
        indicator.startAnimating()
        Client.getEpisodes { response, error in
            self.indicator.stopAnimating()
            self.episodes = response
        }
    }
    
    private func showAndCloseView(){
        episodeListTableView.isHidden.toggle()
    }
    
    private func delegateTableView(){
        episodeListTableView.delegate = self
        episodeListTableView.dataSource = self
        episodeListTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    private func registerTableViewCell(){
        episodeListTableView.register(UINib(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    
}

extension EpisodeListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = episodeListTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? EpisodesTableViewCell, let episodes = self.episodes else {
            return UITableViewCell()
        }
        cell.configure(name: episodes[indexPath.row].title, season: episodes[indexPath.row].season, episode: episodes[indexPath.row].episode)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAndCloseView()
        let popUpView = PopUpView(frame: CGRect(origin: CGPoint(x:view.center.x - 150, y:view.center.y - 250), size: CGSize(width: 300, height: 500)))
        popUpView.alpha = 0
        UIView.animate(withDuration: 1.0) {
            popUpView.alpha = 1
        }
        popUpView.delegate = self
        view.addSubview(popUpView)
        if let text = episodes?[indexPath.row].characters.joined(separator: ", "){
            popUpView.episodeCharactersTextView.text = text
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension EpisodeListViewController: PopUpViewDelegate{
    func xBtnPressed() {
        showAndCloseView()
        episodeListTableView.reloadData()
    }
}
