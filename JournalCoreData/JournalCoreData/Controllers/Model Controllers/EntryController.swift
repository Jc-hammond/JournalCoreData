//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Connor Hammond on 4/26/21.
//

import CoreData

class EntryController {
    
    //MARK: - Properties
    static let shared = EntryController()
    
            ///Source of Truth
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    private init() {}
    
    //MARK: - Functions
    func createEntry(title: String, bodytext: String) {
        let entry = Entry(title: title, bodytext: bodytext)
        entries.append(entry)
        CoreDataStack.saveContext()
    }
    
    func fetchEntries() {
        let entries = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(entries.count)
        self.entries = entries
    }
    
    func updateEntry(_ entry: Entry) {
        CoreDataStack.saveContext()
    }
    
    func deleteMedication() {
        //JCH-
    }
    
}//End of class
