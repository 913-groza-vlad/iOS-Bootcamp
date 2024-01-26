//
//  SceneDelegate.swift
//  curs14dec_URLSchemes
//
//  Created by Orlando Neacsu on 14.12.2023.
//

import UIKit
import Foundation

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    private let deeplinkManager = DeeplinkManager.shared

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        deeplinkManager.window = self.window
        if let urlScheme = connectionOptions.urlContexts.first?.url {
            if let deeplink = Deeplink.parseFrom(url: urlScheme) {
                deeplinkManager.handleDeeplink(deeplink: deeplink)
            }
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}
    func sceneDidBecomeActive(_ scene: UIScene) {}
    func sceneWillResignActive(_ scene: UIScene) {}
    func sceneWillEnterForeground(_ scene: UIScene) {}
    func sceneDidEnterBackground(_ scene: UIScene) {}
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url,
           let deeplink = Deeplink.parseFrom(url: url) {
            deeplinkManager.handleDeeplink(deeplink: deeplink)
        }
    }
}

