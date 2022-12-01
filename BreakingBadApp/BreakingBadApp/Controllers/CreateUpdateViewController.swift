//
//  CreateUpdateViewController.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 28.11.2022.
//

import UIKit

protocol CreateUpdateViewDelegate: AnyObject{
    func buttonPressed()
}

class CreateUpdateViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet private weak var seasonTextField: UITextField!
    @IBOutlet private weak var episodeTextField: UITextField!
    @IBOutlet private weak var noteTextView: UITextView!
    @IBOutlet weak var createUpdateButton: UIButton!
    
    weak var delegate: CreateUpdateViewDelegate?
    
    var note: Note?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewSetup()
        if note != nil {
            updateViewSetup()
        } else {
            createViewSetup()
        }
        
    }
    
    private func textViewSetup(){
        noteTextView.layer.borderWidth = 1.0
        noteTextView.layer.cornerRadius = 10
    }
    
    private func updateViewSetup(){
        titleLabel.text = "Update Note"
        seasonTextField.text = note?.season
        episodeTextField.text = note?.episode
        noteTextView.text = note?.noteDetail
        createUpdateButton.setTitle("Update", for: .normal)
    }
    private func createViewSetup(){
        titleLabel.text = "Add Note"
        createUpdateButton.setTitle("Add", for: .normal)
    }
    
    @available(iOS 13.0, *)
    @IBAction func createUpdateButtonPressed(_ sender: Any) {
        
        if note != nil {
            guard let season = seasonTextField.text, let episode = episodeTextField.text, let noteDetail = noteTextView.text,let updateNote = self.note else { return }
            CoreDataManager.shared.updateNote(season: season, episode: episode, noteDetail: noteDetail, note: updateNote)
            self.dismiss(animated: true)
            
        } else {
            guard let season = seasonTextField.text, let episode = episodeTextField.text, let noteDetail = noteTextView.text else { return }
            CoreDataManager.shared.saveNote(season: season, episode: episode, noteDetail: noteDetail)
            self.dismiss(animated: true)
        }
        delegate?.buttonPressed()
    }
    
}
