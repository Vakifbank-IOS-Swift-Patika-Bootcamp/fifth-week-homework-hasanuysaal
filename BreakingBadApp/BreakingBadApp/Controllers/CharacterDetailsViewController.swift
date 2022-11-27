//
//  CharacterDetailsViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit
import SDWebImage

final class CharacterDetailsViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nickNameLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    var selectedCharacter: SerieCharacter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        nameLabel.text = selectedCharacter?.name
        nickNameLabel.text = selectedCharacter?.nickname
        birthdayLabel.text = selectedCharacter?.birthday
        statusLabel.text = selectedCharacter?.status
        if let url = selectedCharacter?.imageUrl {
            imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "breakingBad"))
            imageView.layer.borderWidth = 1
            imageView.layer.cornerRadius = 25.0
        }
    }
    
    @IBAction func quotesButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toQuotesVC", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuotesVC" {
            let quotesVC = segue.destination as! CharacterQuotesViewController
            quotesVC.characterName = selectedCharacter?.name
        }
    }
}
