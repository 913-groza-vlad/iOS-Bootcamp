//
//  ViewController.swift
//  curs12dec_3
//
//  Created by Vlad Groza on 14.12.2023.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak private var documentNameLabel: UILabel!
    
    private var pickedDocument: URL?
    let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.image, .pdf,])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        documentNameLabel.numberOfLines = 0
        documentNameLabel.text = nil
        picker.allowsMultipleSelection = false
        picker.delegate = self
    }

    @IBAction func onBrowsePressed(_ sender: Any) {
        present(picker, animated: true)
    }
}

extension ViewController: UIDocumentPickerDelegate {
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        DispatchQueue.main.async {
            self.documentNameLabel.text = urls.first?.absoluteString
            self.pickedDocument = urls.first
            controller.dismiss(animated: true)
        }
    }
}

