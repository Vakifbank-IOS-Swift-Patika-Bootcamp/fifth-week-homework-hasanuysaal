//
//  ViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class CharactersViewController: BaseViewController {
    
    @IBOutlet private weak var charactersCollectionView: UICollectionView!
    
    private var characters: [SerieCharacter]?{
        didSet{
            charactersCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersCollectionView.clipsToBounds = false
        delegateCollectionView()
        charactersList()
    }
    
    private func charactersList(){
        indicator.startAnimating()
        Client.getCharacters { characters, error in
            self.indicator.stopAnimating()
            if let error = error {
                self.showAlert(message: error.localizedDescription) {}
                return
            }
            if characters?.isEmpty ?? true {
                self.showAlert(message: "Karakterler Yüklenemedi") {}
                return
            }
            self.characters = characters
        }
    }
    
    private func delegateCollectionView(){
        charactersCollectionView.delegate = self
        charactersCollectionView.dataSource = self
    }
    
}

extension CharactersViewController:  UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = charactersCollectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CharactersCollectionViewCell, let characters = self.characters else {
            return UICollectionViewCell()
        }
        cell.configure(name: characters[indexPath.row].name, nickName: characters[indexPath.row].nickname, birthday: characters[indexPath.row].birthday, imageUrl: characters[indexPath.row].imageUrl)
        return cell
    }
}

extension CharactersViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailsVC", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            guard let detailsVC = segue.destination as? CharacterDetailsViewController, let characters = self.characters, let selectedIndexPath = sender as? IndexPath else {
                return
            }
            detailsVC.selectedCharacter = characters[selectedIndexPath.row]
        }
    }
}
