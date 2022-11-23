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
    @IBOutlet private weak var characterImage: UIImageView!
    
    func configure(name: String, nickName: String, birthday: String){
        nameLabel.text = name
        nickNameLabel.text = nickName
        birthdayLabel.text = birthday
        characterImage.image = UIImage(named: "walterWhite")
    }
    
}
