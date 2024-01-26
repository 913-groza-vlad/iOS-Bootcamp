//
//  APIManager.swift
//  betfair-targets-bconfigs-schemes
//
//  Created by Orlando Neacsu on 07.11.2023.
//

import Foundation

class APIManager {
    
    #if PROD
        let host = "https://api-prod.betfair.ro"
    #elseif DEVELOPMENT
        let host = "https://api-development.betfair.ro"
    #endif
    
    func loadProducts() {
        print(host)
    }
}
