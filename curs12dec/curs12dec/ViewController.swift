//
//  ViewController.swift
//  curs12dec
//
//  Created by Vlad Groza on 12.12.2023.
//

import UIKit

class TestA {
    
    var b = TestB()
    
    init() {
        print("init A")
    }
    
    deinit {
        print("deinit A")
    }
}

class TestB {
    
    weak var a: TestA?
    
    init() {
        print("init B")
    }
    
    deinit {
        print("deinit B")
    }
}

class ViewController: UIViewController {
    
    var globalTestA: TestA?
    var global2TestA: TestA?
    weak var weakA: TestA?
    var strongA: TestA?

    
    @IBOutlet private weak var imageView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let testA = TestA()
//        globalTestA = testA
//        global2TestA = testA
//        globalTestA = nil
//        strongA = testA
//        strongA = nil
//        weakA = testA
//
//        let tempA = TestA()
//        // let tempB = TestB()
//        tempA.b.a = tempA
        
        picker.delegate = self
        imageView.contentMode = .scaleAspectFill
    }


    @IBAction private func onBrowsePressed(_ sender: Any) {
        let alert = UIAlertController(title: "Choose picker source", message: "Gallery or camera?", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] _ in
            guard let self else {return}
            self.picker.sourceType = .camera
            self.present(self.picker, animated: true)
        }
        
        let galleryAction = UIAlertAction(title: "Gallery", style: .default) { [weak self] _ in
            guard let self else {return}
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: true)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        DispatchQueue.main.async {
            let image = info[.originalImage] as? UIImage
            self.imageView.image = image
            picker.dismiss(animated: true)
        }
    }
}
