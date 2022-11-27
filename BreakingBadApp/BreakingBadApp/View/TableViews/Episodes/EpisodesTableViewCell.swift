//
//  EpisodesTableViewCell.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class EpisodesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var seasonLabel: UILabel!
    
    func configure(name: String, season: String, episode: String){
        nameLabel.text = name
        seasonLabel.text = "S\(season)/E\(episode)"
    }
}
