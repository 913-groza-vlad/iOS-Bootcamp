//
//  ViewController.swift
//  Tema3
//
//  Created by Vlad Groza on 29.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var namesTableView: UITableView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet weak var bottomConstraints: NSLayoutConstraint!
    
    private var groupedNames: [String: [String]] = [:]
    private var sectionTitles: [String] = []
    private var names: [String] = ["Vlad", "Ana", "Dan", "Marian", "Marius", "James", "Ami", "Dani", "Alex", "Toni"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupedNames = Dictionary(grouping: names, by: { String($0.first ?? " ") })
        sectionTitles = groupedNames.keys.sorted()
        
        addKeyboardObservers()
        
        namesTableView.delegate = self
        namesTableView.dataSource = self
        nameTextField.delegate = self
    }
    
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardAppeared),
            name: UIApplication.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onKeyboardDisappeared),
            name: UIApplication.keyboardWillHideNotification,
            object: nil
        )
    }
    
    
    @objc
    private func onKeyboardAppeared(_ sender: NSNotification) {
        if let keyboardFrame: NSValue = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            bottomConstraints.constant = keyboardHeight
        }
    }
    
    @objc
    private func onKeyboardDisappeared(_ sender: NSNotification) {
        bottomConstraints.constant = 0
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func addNewName(_ name: String) {
        guard !names.contains(name) else {
            print("Name already exists.")
            return
        }
        
        let firstLetter = String(name.first ?? " ")
        names.append(name)

            // Update the groupedNames dictionary
        if var existingSection = groupedNames[firstLetter] {
            existingSection.append(name)
            groupedNames[firstLetter] = existingSection.sorted()
        } else {
            groupedNames[firstLetter] = [name]
            sectionTitles = groupedNames.keys.sorted()
        }

        // Reload the table view
        namesTableView.reloadData()
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionTitle = sectionTitles[section]
        return groupedNames[sectionTitle]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableCell", for: indexPath) as! CustomTableCell

        let sectionTitle = sectionTitles[indexPath.section]
        if let namesInSection = groupedNames[sectionTitle], indexPath.row < namesInSection.count {
            cell.configure(string: namesInSection[indexPath.row])
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionTitle = sectionTitles[indexPath.section]
        if let namesInSection = groupedNames[sectionTitle], indexPath.row < namesInSection.count {
            print(namesInSection[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let newName = textField.text, !newName.isEmpty {
            addNewName(newName)
            textField.text = nil // Clear the text field after adding the name
        }

        return true
    }

}
