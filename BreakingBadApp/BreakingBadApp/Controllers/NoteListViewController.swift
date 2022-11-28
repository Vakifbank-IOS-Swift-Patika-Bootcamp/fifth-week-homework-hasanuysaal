//
//  NoteViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 28.11.2022.
//

import UIKit

final class NoteListViewController: BaseViewController {

    @IBOutlet weak var noteListTableView: UITableView!
    
    private let addNoteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(addNoteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noteListTableView.delegate = self
        noteListTableView.dataSource = self
        view.addSubview(addNoteButton)
        
    }
    
    @objc private func addNoteButtonPressed(){
        //present add note view
        print("pressed")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addNoteButton.frame = CGRect(x: view.frame.size.width - 100, y: view.frame.size.height - 170, width: 50, height: 50)
    }
}

extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
}
