//
//  APIManager2.swift
//  betfair-targets-bconfigs-schemes
//
//  Created by Orlando Neacsu on 07.11.2023.
//

import Foundation

class APIManager {
    
    #if PROD
        let host = "https://api-prod.superbet.ro"
    #elseif DEVELOPMENT
        let host = "https://api-development.superbet.ro"
    #endif
    
    func loadProducts() {
        print(host)
    }
}
