//
//  CharacterQuotesViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class CharacterQuotesViewController: UIViewController {
    
    @IBOutlet private weak var quotesTableView: UITableView!
    
    var characterName: String?
    var characterQuotes: [Quotes]?{
        didSet{
            quotesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTableView()
        registerTableView()
        guard let name = characterName else {
            return
        }
        
        Client.getQuotes(from: name) { quotes, error in
            self.characterQuotes = quotes
        }
    }
    
    private func delegateTableView(){
        quotesTableView.delegate = self
        quotesTableView.dataSource = self
    }
    
    private func registerTableView(){
        quotesTableView.register(UINib(nibName: "QuotesTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomQuotesTableViewCell")
    }
    
}

extension CharacterQuotesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = characterQuotes?.count else{
            return 1
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = quotesTableView.dequeueReusableCell(withIdentifier: "CustomQuotesTableViewCell", for: indexPath) as? QuotesTableViewCell,let quotes = characterQuotes else {
            return UITableViewCell()
        }
        cell.configure(name: quotes[indexPath.row].author, quote: quotes[indexPath.row].quote)
        return cell
    }
}
