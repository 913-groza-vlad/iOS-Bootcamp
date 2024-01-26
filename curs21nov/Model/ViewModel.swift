//
//  ViewModel.swift
//  curs21nov
//
//  Created by Orlando Neacsu on 21.11.2023.
//

import Foundation

// CLASA B

protocol ViewModelDelegate {
    func imageHasLoaded(data: Data)
}

class ViewModel {
    
    private let apiManager = APIManager.instance
    
    var delegate: ViewModelDelegate?
    
    func loadImage() {
        apiManager.loadImage { data in
            self.delegate?.imageHasLoaded(data: data)
        }
    }
}
