//
//  PostIdInputController.swift
//  curs14dec_URLSchemes
//
//  Created by Orlando Neacsu on 14.12.2023.
//

import UIKit

/*
 URLScheme vs UniversalLink
 
 URLScheme: (Configurarea se face DOAR la nivel de aplicatie)
 emag://product?id=10
 
 UniversalLink: (Configurarea se face la nivel de aplicatie, DAR si la nivel web)
 https://emag.ro/product?id=10
 https:emag.ro/apple-app-site-association
 
 
 */

final class PostIdInputController: UIViewController {
    
    private let deeplinkManager = DeeplinkManager.shared
    
    @IBOutlet private weak var postIdTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postIdTextfield.keyboardType = .numberPad
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        deeplinkManager.startDeeplinkHandling()
        
    }
    
    private func showPost(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostDetailsController") as! PostDetailsController
        controller.postId = id
        present(controller, animated: true)
    }
    
    @IBAction private func onShowPostPressed(_ sender: Any) {
        if let id = Int(postIdTextfield.text!) {
            showPost(id: id)
        } else {
            let alert = UIAlertController(title: "Error", message: "ID Invalid", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Ok", style: .cancel)
            alert.addAction(cancel)
            present(alert, animated: true)
        }
    }
    
    
}
