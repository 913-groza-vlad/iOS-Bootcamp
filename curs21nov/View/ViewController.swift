//
//  ViewController.swift
//  curs21nov
//
//  Created by Orlando Neacsu on 21.11.2023.
//

import UIKit
import Kingfisher
import SDWebImage

// CLASA A

class ViewController: UIViewController {
    
    @IBOutlet private weak var centerImageView: UIImageView!
    
    private let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.loadImage()
//        centerImageView.kf.setImage(with: URL(string: "https://picsum.photos/200"))
//        centerImageView.sd_setImage(with: URL(string: "https://picsum.photos/200"))
    }
    
    func setImage(image: UIImage?) {
        centerImageView.image = image
    }
    
    
    @IBAction private func onPushPressed(_ sender: Any) {
        performSegue(withIdentifier: "pushSegue", sender: nil)
    }
    
    
    @IBAction private func onPresentPressed(_ sender: Any) {
        performSegue(withIdentifier: "modalSegue", sender: nil)
//        performSegue(withIdentifier: "modalSegue", sender: nil)
    }
    
}

extension ViewController: ViewModelDelegate {
    func imageHasLoaded(data: Data) {
        setImage(image: UIImage(data: data))
    }
}

/*
 1. Create Podfile
 1.a navigam din terminal catre folderul cu proiectul
 1.b rulam in terminal comanda 'pod init'
 
 2. Adaugarea dependitelor in Podfile
 2.a adaugarea pod-urilor in fisierul Podfile din folderul cu proiectul
 
 3. Instalarea dependintelor
 3.a navigam din terminal catre folderul cu proiectul
 3.b rulam in terminal comanda 'pod install'
 
 4. dupa instalarea dependintelor, proiectul se va deschide doar din fisierul nou create "~~~.workspace"
 
 
 5. La viitoarele "pod install", vor fi instalate aceleasi versiuni ca la primul "pod install" sau ca la ultimul "pod update" deoarece versiunile care vor fi instalate sunt scrise in Podfile.lock
 */

/*
 Delegates
 
 - folosim pt comunicare one to one
 
 
 
 */

protocol ClassADelegate {
    func bHasDone()
    func anotherMethod()
}

class A {

    let b: B
    
    init() {
        b = B()
        b.classADelegate = self
    }
    
    func tellBDoSth() {
        b.doSth()
    }
    
}

extension A: ClassADelegate {
    func bHasDone() {
        print("A: task completed by B")
    }
    
    func anotherMethod() {
        print("altceva")
    }
}

class B {
    
    var classADelegate: ClassADelegate?

    func doSth() {
        print("B: work in progress")
        print("B: work in progress")
        print("B: work in progress")
        print("B: work in progress")
        classADelegate?.bHasDone()
        classADelegate?.anotherMethod()
    }
}

