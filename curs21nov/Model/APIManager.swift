//
//  APIManager.swift
//  curs21nov
//
//  Created by Orlando Neacsu on 21.11.2023.
//

import Foundation

class APIManager {
    
    static let instance = APIManager()
    
    private init() {}
    
    func loadImage(
        completionHandler: @escaping (Data) -> ()
    ) {
        DispatchQueue.global().async {
            do {
                let image = try Data(contentsOf: URL(string: "https://picsum.photos/200")!)
                DispatchQueue.main.async {
                    completionHandler(image)
                }
            } catch {
                print(error)
            }
        }
        // se porneste request-ul
        // waiting
        // waiting
        // waiting
        // se apeleaza un closure in momentul in care request-ul s a terminat
        completionHandler(Data())
    }
    
}
