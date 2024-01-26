//
//  PostIdInputViewController.swift
//  curs14dec_urlSchemes
//
//  Created by Vlad Groza on 14.12.2023.
//

import UIKit

class PostIdInputViewController: UIViewController {

    @IBOutlet private weak var postIdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postIdTextField.keyboardType = .numberPad
    }
    
    private func showPost(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostDetailsController") as! PostDetailsController
        controller.postId = id
        present(controller, animated: true)
    }

    @IBAction func onShowPostPressed(_ sender: Any) {
        if let id = Int(postIdTextField.text!) {
            showPost(id: id)
        } else {
            let alert = UIAlertController(title: "Error", message: "Invalid ID", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
    
}
