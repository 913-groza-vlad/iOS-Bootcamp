//
//  CoreDataManager.swift
//  curs13ian_coreData
//
//  Created by Vlad Groza on 13.01.2024.
//

import Foundation
import CoreData
import UIKit
import Combine

class CoreDataManager {
    static let shared = CoreDataManager()
    //  private var cancellable: AnyCancellable?
    
    private init() {
//        cancellable = NotificationCenter.default.publisher(for: UIApplication.didEnterBackgroundNotification).sink { [weak self] _ in
//            self?.saveContext()
//        }
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(saveContext),
            name: UIApplication.didEnterBackgroundNotification,
            object: nil
        )
        // NOTE: when an observer is used, it must be removed when we don't need it anymore
    }
    
    
    private lazy var persistentContainer: NSPersistentContainer = {
    
        let container = NSPersistentContainer(name: "curs13ian_coreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    private func getPersonEntities() -> [NSManagedObject] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PersonEntity")
        do {
             return try persistentContainer.viewContext.fetch(fetchRequest) as! [NSManagedObject]
        }
        catch {
            return []
        }
    }
    
    func getPersons() -> [Person] {
        let managedObjects = getPersonEntities()
        let persons = managedObjects.map { managedObject in
            Person(
                id: managedObject.value(forKey: "id") as! String,
                name: managedObject.value(forKey: "name") as! String,
                age: Int(managedObject.value(forKey: "age") as! Int64)
            )
        }
        
        return persons
    }
    
    
    func getPerson(id: String) -> Person? {
        getPersons().first { person in
            person.id == id
        }
    }
    
    func editPerson(personToEditId: String, newName: String, newAge: Int) -> Person? {
        let objects = getPersonEntities()
        if let object = objects.first(where: {
            ($0.value(forKey: "id") as? String) == personToEditId
        }) {
            object.setValue(newName, forKey: "name")
            object.setValue(newAge, forKey: "age")
            saveContext()
            return Person(
                id: personToEditId,
                name: object.value(forKey: "name") as! String,
                age: object.value(forKey: "age") as! Int
            )
        }
            
        return nil
    }
    
    func addPerson(person: Person) {
        let personEntity = PersonEntity(context: persistentContainer.viewContext)
        personEntity.id = person.id
        personEntity.name = person.name
        personEntity.age = Int64(person.age)
    }
    
    func deletePerson(id: String) {
        let objects = getPersonEntities()
        if let objectForDelete = objects.first(where: { object in
            (object.value(forKey: "id") as? String) == id
        }) {
            persistentContainer.viewContext.delete(objectForDelete)
        }
    }
    
    func deleteAllPerson() {
        let objects = getPersonEntities()
        objects.forEach { object in
            persistentContainer.viewContext.delete(object)
        }
    }
    
    // MARK: - Core Data Saving support
    @objc
    private func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    deinit { // NOTE: redundant - singleton class
        NotificationCenter.default.removeObserver(self)
    }
}
