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
    
    
    func configure(name: String, nickName: String, birthday: String, imageUrl: String){
        nameLabel.text = name
        nickNameLabel.text = nickName
        birthdayLabel.text = birthday
        characterImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "breakingBad"))
        setCellAppearance()
    }
    
    private func setCellAppearance(){
        self.layer.cornerRadius = 25.0
        viewWithTag(10)?.backgroundColor = .clear
        viewWithTag(10)?.layer.borderWidth = 3.0
        viewWithTag(10)?.layer.cornerRadius = 25.0
    }
    
}
