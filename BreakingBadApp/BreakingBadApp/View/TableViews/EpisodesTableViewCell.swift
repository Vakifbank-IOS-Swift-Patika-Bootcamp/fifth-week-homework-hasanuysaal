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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(name: String, season: String){
        nameLabel.text = name
        seasonLabel.text = season
    }
}
