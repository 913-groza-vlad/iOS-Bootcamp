//
//  ViewModel.swift
//  curs13ian_coreData
//
//  Created by Vlad Groza on 13.01.2024.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func personLoaded(person: [Person])
    func personsLoadedWithFailure(error: Error)
}

class ViewModel {
    private let coreDataManager = CoreDataManager.shared
    
    weak var delegate: ViewModelDelegate?
    private(set) var persons: [Person]?
    
    func loadPersons() {
        let persons = coreDataManager.getPersons()
        self.persons = persons
        delegate?.personLoaded(person: persons)
    }
    
    func addPerson(person: Person) {
        coreDataManager.addPerson(person: person)
        loadPersons()
    }
    
    func deleteAll() {
        coreDataManager.deleteAllPerson()
        loadPersons()
    }
    
    func deletePerson(id: String) {
        coreDataManager.deletePerson(id: id)
        loadPersons()
    }
    
    func updatePerson(id: String, newName: String, newAge: Int) -> Person? {
        let updatedPerson = coreDataManager.editPerson(personToEditId: id, newName: newName, newAge: newAge)
        if updatedPerson != nil {
            loadPersons();
        }
        return updatedPerson
    }
    
    func getPerson(id: String) -> Person? {
        return coreDataManager.getPerson(id: id)
    }
}
