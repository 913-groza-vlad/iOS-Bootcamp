//
//  ViewController.swift
//  curs14dec_delegates
//
//  Created by Vlad Groza on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToModalController" {
            let destination = segue.destination as! ModalController
            destination.delegate = self
        }
    }

    @IBAction private func onPresentModalControllerPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueToModalController", sender: nil)
    }
    
    @IBAction func onPresentModalPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "ModalController") as! ModalController
        controller.changeBackgroundColorAction = { [weak self] newColor in
            guard let self else {return}
            self.view.backgroundColor = newColor
        }
        self.present(controller, animated: true)
    }
    
}

extension ViewController: ViewControllerDelegate {
    func changeViewControllerBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
}

