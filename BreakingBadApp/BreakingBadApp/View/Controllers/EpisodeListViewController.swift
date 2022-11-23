//
//  EpisodeListViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class EpisodeListViewController: UIViewController {
    
    @IBOutlet private weak var episodeListTableView: UITableView!
    
    let bounds = UIScreen.main.bounds
    
    private unowned var characterView: UIView {
        let view = UIView()
        view.frame = CGRect(x: 20, y: 50, width: bounds.width - 40, height: bounds.height - 300)
        view.backgroundColor = .systemGray6
        view.tag = 1
        return view
    }
    
    private unowned var xButton: UIButton {
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateTableView()
        registerTableViewCell()
        view.addSubview(characterView)
        view.addSubview(xButton)
        episodeListTableView.tag = 3
        episodeListTableView.isHidden = true
        showAndCloseView()
        
    }
    
    private func showAndCloseView(){
        view.viewWithTag(1)?.isHidden.toggle()
        view.viewWithTag(2)?.isHidden.toggle()
        view.viewWithTag(3)?.isHidden.toggle()
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
        showAndCloseView()
        print(indexPath.row)
    }
    
}
