//
//  ViewController.swift
//  betfair-targets-bconfigs-schemes
//
//  Created by Orlando Neacsu on 07.11.2023.
//

import UIKit

// BUILD CONFIGURATIONS
// TARGET
// SCHEME

class ViewController: UIViewController {
    
    private let apiManager = APIManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.loadProducts()
    }


}

