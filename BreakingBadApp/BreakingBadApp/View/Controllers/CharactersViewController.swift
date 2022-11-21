//
//  ViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class CharactersViewController: UIViewController {

    @IBOutlet private weak var charactersCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegatenCollectionView()
        
    }
    
    
    private func delegatenCollectionView(){
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
    }

}

extension CharactersViewController:  UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CharactersCollectionViewCell
        cell.configure(name: "Hasan", nickName: "Uysal", birthday: "21.03.1998")
        return cell
    }
    
    
}

extension CharactersViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let detailsVC = segue.destination as! CharacterDetailsViewController
            detailsVC.count = 5
        }
    }
}
