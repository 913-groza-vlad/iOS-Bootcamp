//
//  ViewController.swift
//  curs13ian_coreData
//
//  Created by Vlad Groza on 13.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var personsTableView: UITableView!
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.delegate = self
        personsTableView.dataSource = self
        personsTableView.delegate = self
    
        // viewModel.addPerson(person: Person(name: "Vlad", age: 21))
        viewModel.loadPersons()
    }
    
    private func validateAddPerson(name: String, age: String) {
        if name.count < 3 {
            showError(err: "Name is too short!")
            return
        }
        if Int(age) == nil {
            showError(err: "Age is invalid!")
            return
        }
        
        let person = Person(name: name, age: Int(age)!)
        
        viewModel.addPerson(person: person)
        showMessage(title: "Success", msg: "Person successfully added!")
    }
    
    
    private func validateEditPerson(id: String, name: String, age: String) {
        if name.count < 3 {
            showError(err: "Name is too short!")
            return
        }
        if Int(age) == nil {
            showError(err: "Age is invalid!")
            return
        }
        
        let person = viewModel.updatePerson(id: id, newName: name, newAge: Int(age)!)
        if person != nil {
            showMessage(title: "Success", msg: "Person successfully updated!")
        }
        else {
            showError(err: "Error updating person!")
        }
    }
    
    private func showMessage(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(dismissAction)
        
        present(alert, animated: true)
    }
    
    private func showError(err: String) {
        showMessage(title: "Error", msg: err)
    }
    
    private func confirmDelete(id: String) {
        viewModel.deletePerson(id: id)
        showMessage(title: "Success", msg: "Person deleted successfully")
    }
    
    @IBAction func onAddPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Name"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "Age"
            textField.keyboardType = .numberPad
        }
        
        let submitAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self else {return}
            let name = alert.textFields![0].text!
            let age = alert.textFields![1].text!
            self.validateAddPerson(name: name, age: age)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        }
        
        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    @IBAction func onDeleteAllPressed(_ sender: Any) {
        viewModel.deleteAll()
        showMessage(title: "Success", msg: "Persons have been deleted successfully")
    }
}

extension ViewController: ViewModelDelegate {
    func personLoaded(person: [Person]) {
        personsTableView.reloadData()
    }
    
    func personsLoadedWithFailure(error: Error) {
        print(error)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.persons?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = viewModel.persons![indexPath.row]
        cell.textLabel?.text = person.name
        cell.detailTextLabel?.text = "Age: \(person.age)"
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    private func handleDelete(id: String) {
        let alert = UIAlertController(title: "Delete person", message: "Are you sure?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { [weak self] _ in
            guard let self else {return}
            self.confirmDelete(id: id)
        }
        
        let noAction = UIAlertAction(title: "No", style: .cancel) { _ in
        }
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
    }
    
    private func handleUpdate(id: String) {
        let person = self.viewModel.getPerson(id: id)
        let alert = UIAlertController(title: "Edit Person", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.text = person?.name
        }
        
        alert.addTextField { textField in
            textField.text = String((person?.age)!)
            textField.keyboardType = .numberPad
        }
        
        let submitAction = UIAlertAction(title: "Update", style: .default) { [weak self] _ in
            guard let self else {return}
            let name = alert.textFields![0].text!
            let age = alert.textFields![1].text!
            self.validateEditPerson(id: id, name: name, age: age)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
        }
        
        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal,
                                        title: "Delete") { [weak self] (action, view, completionHandler) in
            let personToDelete = self!.viewModel.persons![indexPath.row]
            self?.handleDelete(id: personToDelete.id)
            completionHandler(true)
        }
        deleteAction.backgroundColor = .systemRed
        
        let editAction = UIContextualAction(style: .normal, title: "Edit") {
            [weak self] (action, view, completionHandler) in
            let personToEdit = self!.viewModel.persons![indexPath.row]
            self?.handleUpdate(id: personToEdit.id)
            completionHandler(true)
        }
        
        editAction.backgroundColor = .systemGreen
        
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
