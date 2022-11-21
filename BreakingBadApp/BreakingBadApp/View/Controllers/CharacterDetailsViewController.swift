//
//  CharacterDetailsViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    var count = 0
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func quotesButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "toQuotesVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuotesVC" {
            let quotesVC = segue.destination as! CharacterQuotesViewController
            quotesVC.count = count
        }
    }
}
