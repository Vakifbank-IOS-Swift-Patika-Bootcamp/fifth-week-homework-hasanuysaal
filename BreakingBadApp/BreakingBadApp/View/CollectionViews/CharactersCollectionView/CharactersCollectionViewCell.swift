//
//  CharactersCollectionViewCell.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class CharactersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nickNameLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    
    func configure(name: String, nickName: String, birthday: String){
        nameLabel.text = name
        nickNameLabel.text = nickName
        birthdayLabel.text = birthday
    }
    
}
