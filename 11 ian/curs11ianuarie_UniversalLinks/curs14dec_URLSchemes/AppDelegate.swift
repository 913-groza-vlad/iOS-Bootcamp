//
//  AppDelegate.swift
//  curs14dec_URLSchemes
//
//  Created by Orlando Neacsu on 14.12.2023.
//

import UIKit

/*
 
 1. URL Schemes: emag://productId?id=10
 
 scheme://host/path?query1=10
 
 2. UNIVERSAL LINKs (este necesar sa configurati si site-ul adaugand acel apple-app-site-association file in root-ul acestuia)
 
 https://emag.ro/products?id=10 
 
 */

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

