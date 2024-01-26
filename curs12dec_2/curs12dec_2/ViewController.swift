//
//  ViewController.swift
//  curs12dec_2
//
//  Created by Vlad Groza on 12.12.2023.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet private weak var imageView: UIImageView!
    
    @IBOutlet private weak var bottomImageView: UIImageView!
    
    private var picker: PHPickerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 2
        picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
    }

    @IBAction func onBrowsePressed(_ sender: Any) {
        present(self.picker, animated: true)
    }
    
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        DispatchQueue.main.async {
            picker.dismiss(animated: true)
        }
                
        results.enumerated().forEach { (index, result) in
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image , error  in
                    guard let self else {return}
                    if let error {
                        print(error)
                    }
                    if let selectedImage = image as? UIImage {
                        DispatchQueue.main.async {
                            if index == 0 {
                                self.imageView.image = selectedImage
                            } else {
                                self.bottomImageView.image = selectedImage
                            }
                        }
                    }
                }
            }
        }
    }
}

