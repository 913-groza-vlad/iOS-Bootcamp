//
//  ViewController.swift
//  curs28nov
//
//  Created by Vlad Groza on 28.11.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let list1: [String] = (0...100).map { index in
        var word = ""
        (0...Int.random(in: (1000...1500))).forEach { index in
            word.append(String(index))
        }
        
        return word
    }
    private let list2: [String] = (101...200).map { "Elementul nr. \($0)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(list1[indexPath.row])
        }
        else {
            print(list2[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // 
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return list1.count
        } else if section == 1 {
            return list2.count
        }
        fatalError()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        if indexPath.section == 0 {
            cell.configure(string: list1[indexPath.row])
        }
        else {
            cell.configure(string: list2[indexPath.row])
        }
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .yellow
        }
//        else {
//            cell.backgroundColor = .cyan
//        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath)
//
////        cell.textLabel?.text = ""
////        cell.backgroundColor = .white
//
//        if indexPath.section == 0 {
//            cell.textLabel?.text = list1[indexPath.row]
//        }
//        else {
//            cell.textLabel?.text = list2[indexPath.row]
//        }
//
//
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = .yellow
//        }
//        else {
//            cell.backgroundColor = .cyan
//        }
//
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Prima Sectiune"
        }
        else {
            return "A Doua Sectiune"
        }
    }
}

