//
//  QuotesTableViewCell.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 23.11.2022.
//

import UIKit

final class QuotesTableViewCell: UITableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var quoteLabel: UILabel!
    
    func configure(name: String, quote: String){
        nameLabel.text = name
        quoteLabel.text = quote
    }
    
}
