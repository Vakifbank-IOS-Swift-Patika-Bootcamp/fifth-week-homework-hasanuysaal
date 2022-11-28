//
//  NoteViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 28.11.2022.
//

import UIKit

@available(iOS 13.0, *)
final class NoteListViewController: BaseViewController {
    
    @IBOutlet private weak var noteListTableView: UITableView!
    
    private var notes: [Note] = []
    
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
        notes = CoreDataManager.shared.getNotes()
        noteListTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
        
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

@available(iOS 13.0, *)
extension NoteListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = noteListTableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell, let episode = notes[indexPath.row].episode, let season = notes[indexPath.row].season, let noteDetail = notes[indexPath.row].noteDetail else {
            return UITableViewCell()
        }
        cell.configure(note: noteDetail, season: season, episode: episode)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let note = notes[indexPath.row]
            CoreDataManager.shared.deleteNote(note: note)
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
