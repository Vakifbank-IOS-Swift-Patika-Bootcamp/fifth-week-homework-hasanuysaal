//
//  EpisodeListViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class EpisodeListViewController: ActivityIndicatorViewController {
    
    @IBOutlet private weak var episodeListTableView: UITableView!
    
    private var episodes: [Episode]? {
        didSet{
            episodeListTableView.reloadData()
        }
    }
    private let bounds = UIScreen.main.bounds
    
    private var characterView: UIView {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 50, width: bounds.width - 40, height: bounds.height - 300)
        view.backgroundColor = .systemGray6
        view.tag = 1
        return view
    }
    
    private var xButton: UIButton {
        let button = UIButton()
        button.frame = CGRect(x: characterView.bounds.width - 5, y: 55, width: bounds.width * 0.05, height: bounds.width * 0.05)
        button.tag = 2
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(xButtonTapped), for: .touchUpInside)
        return button
    }
    
    private var characterLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateTableView()
        registerTableViewCell()
        view.addSubview(characterView)
        view.addSubview(xButton)
        createCharacterLabel()
        episodeListTableView.tag = 3
        episodeListTableView.isHidden = true
        showAndCloseView()
        
        indicator.startAnimating()
        Client.getEpisodes { response, error in
            self.indicator.stopAnimating()
            self.episodes = response
        }
    }
    
    private func showAndCloseView(){
        view.viewWithTag(1)?.isHidden.toggle()
        view.viewWithTag(2)?.isHidden.toggle()
        view.viewWithTag(3)?.isHidden.toggle()
        view.viewWithTag(4)?.isHidden.toggle()
    }
    
    private func createCharacterLabel(){
        characterLabel.frame = CGRect(x: 30, y: 70, width: bounds.width - 70, height: bounds.height - 350)
        characterLabel.font = UIFont.systemFont(ofSize: 17)
        characterLabel.numberOfLines = 0
        characterLabel.tag = 4
        characterLabel.textColor = .black
        view.addSubview(characterLabel)
    }
    
    @objc func xButtonTapped(_ sender: UIButton!){
        showAndCloseView()
    }
    
    private func delegateTableView(){
        episodeListTableView.delegate = self
        episodeListTableView.dataSource = self
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
        cell.configure(name: episodes[indexPath.row].title, season: episodes[indexPath.row].season)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAndCloseView()
        if let text = episodes?[indexPath.row].characters.joined(separator: " "){
            characterLabel.text = text
        }
    }
    
}
