//
//  ViewController.swift
//  curs12dec_file_manager
//
//  Created by Vlad Groza on 12.12.2023.
//

import UIKit

class ViewController: UIViewController {

    let folder = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        write()
        // delete()
        read()
        
        do {
            let paths = try FileManager.default.contentsOfDirectory(atPath: folder.relativePath)
            print(paths)
        }
        catch {
            print(error)
        }
    }
    
    func delete() {
        do {
            try FileManager.default.removeItem(at: folder.appendingPathExtension("betfair.txt"))
        }
        catch {
            print(error)
        }
    }
    
    func read() {
        do {
            let data = try Data(contentsOf: folder.appendingPathExtension("betfair.txt"))
            print(String(data: data, encoding: .utf8) as Any)
        }
        catch {
            print(error)
        }
    }

    func write() {
        let text = "Curs Betfair"
        let data = text.data(using: .utf8)!
        
        do {
            try data.write(to: folder.appendingPathExtension("betfair.txt"))
            print("fisierul a fost scris")
        } catch {
            print("Eroare")
            print(error)
        }
    }
}

