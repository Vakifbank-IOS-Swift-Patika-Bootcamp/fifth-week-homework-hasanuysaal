//
//  CoreDataManager.swift
//  BreakingBadApp
//
//  Created by Hasan Uysal on 28.11.2022.
//

import Foundation

import UIKit
import CoreData

@available(iOS 13.0, *)
final class CoreDataManager {
    static let shared = CoreDataManager()
    private let managedContext: NSManagedObjectContext!
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    @discardableResult
    func saveNote(season: String, episode: String, noteDetail: String) -> Note? {
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: managedContext)!
        let note = NSManagedObject(entity: entity, insertInto: managedContext)
        note.setValue(season, forKeyPath: "season")
        note.setValue(episode, forKeyPath: "episode")
        note.setValue(noteDetail, forKeyPath: "noteDetail")
        
        do {
            try managedContext.save()
            return note as? Note
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
        
        return nil
    }
    
    func getNotes() -> [Note] {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Note")
        do {
            let notes = try managedContext.fetch(fetchRequest)
            return notes as! [Note]
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return []
    }
    
    func deleteNote(note: Note) {
        
        managedContext.delete(note)
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
