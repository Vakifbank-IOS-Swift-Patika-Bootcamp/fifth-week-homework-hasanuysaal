//
//  NoteTableViewCell.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 28.11.2022.
//

import UIKit

final class NoteTableViewCell: UITableViewCell {

    @IBOutlet private weak var noteLabel: UILabel!
    @IBOutlet private weak var seasonEpisodeLabel: UILabel!
    
    func configure(note: String, season: String, episode: String){
        noteLabel.text = note
        seasonEpisodeLabel.text = "S\(season)/E\(episode)"
        
    }
}
