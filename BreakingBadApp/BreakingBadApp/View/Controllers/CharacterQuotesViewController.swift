//
//  CharacterQuotesViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 21.11.2022.
//

import UIKit

final class CharacterQuotesViewController: UIViewController {
    
    @IBOutlet private weak var quotesTableView: UITableView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTableView()
    }
    
    private func delegateTableView(){
        quotesTableView.delegate = self
        quotesTableView.dataSource = self
    }
    
}

extension CharacterQuotesViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
}
