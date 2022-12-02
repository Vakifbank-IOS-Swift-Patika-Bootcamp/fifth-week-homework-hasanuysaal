//
//  NoteViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 28.11.2022.
//

import UIKit



@available(iOS 13.0, *)
final class NoteListViewController: BaseViewController{

    @IBOutlet private weak var noteListTableView: UITableView!
    
    private var notes: [Note] = [] {
        didSet{
            noteListTableView.reloadData()
        }
    }
    
    private let addNoteButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let image = UIImage(systemName: "plus")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.backgroundColor = .red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(addNoteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBarTitle(view: self, title: "Notes")
        
        notes = CoreDataManager.shared.getNotes()
        noteListTableViewSetup()
        view.addSubview(addNoteButton)
    }
    
    
    private func noteListTableViewSetup(){
        noteListTableView.delegate = self
        noteListTableView.dataSource = self
        noteListTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
        noteListTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    @objc private func addNoteButtonPressed(){
        performSegue(withIdentifier: "toCreateUpdateView", sender: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        addNoteButton.frame = CGRect(x: view.frame.size.width - 100, y: view.frame.size.height - 170, width: 50, height: 50)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCreateUpdateView" {
            let destinationVC = segue.destination as! CreateUpdateViewController
            destinationVC.delegate = self
            guard let indexPath = sender as? IndexPath else {
                return
            }
            destinationVC.note = notes[indexPath.row]
        }
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
        performSegue(withIdentifier: "toCreateUpdateView", sender: indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            let note = self.notes[indexPath.row]
            CoreDataManager.shared.deleteNote(note: note)
            self.notes.remove(at: indexPath.row)
        completionHandler(true)
    }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

@available(iOS 13.0, *)
extension NoteListViewController: CreateUpdateViewDelegate{
    func buttonPressed() {
        notes = CoreDataManager.shared.getNotes()
    }
}


