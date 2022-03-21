// CoreDataManager.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 20/03/2022
// 

import CoreData
import UIKit

final class CoreDataManager {
    
    lazy var persistenContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventCountDown") // give same name as xcdatamodel
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var managedObjectContent: NSManagedObjectContext {
        persistenContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: managedObjectContent)
        event.setValue(name, forKey: "name")
        
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try managedObjectContent.save()
        } catch  {
            print(error)
        }
    }
    
    func fetchEvent() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try managedObjectContent.fetch(fetchRequest)
            return events
        } catch {
            print("error2")
            return []
        }
    }
    
}
