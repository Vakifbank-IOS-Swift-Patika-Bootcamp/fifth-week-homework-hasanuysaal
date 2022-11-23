//
//  ViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class CharactersViewController: UIViewController {
    
    @IBOutlet private weak var charactersCollectionView: UICollectionView!
    
    private var characters: [SerieCharacter]?{
        didSet{
            charactersCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegateCollectionView()
        charactersList()
        
    }
    
    private func charactersList(){
        Client.getCharacters { characters, error in
            print(characters)
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
        cell.configure(name: characters[indexPath.row].name, nickName: characters[indexPath.row].nickname, birthday: characters[indexPath.row].birthday)
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
            print(selectedIndexPath)
            print(characters[selectedIndexPath.row])
            detailsVC.selectedCharacter = characters[selectedIndexPath.row]
            /*
            detailsVC.configure(
                name: characters[selectedIndexPath.row].name,
                nickname: characters[selectedIndexPath.row].nickname,
                birthday: characters[selectedIndexPath.row].birthday,
                status: characters[selectedIndexPath.row].status
            )*/
        }
    }
}
