//
//  DeeplinkManager.swift
//  curs14dec_URLSchemes
//
//  Created by Orlando Neacsu on 19.12.2023.
//

import Foundation
import UIKit

enum Deeplink {
    case postDetails(id: Int)
    
    static func parseFromUniversalLink(url: URL) -> Deeplink? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        // https://emag.ro/post?id=10
        
        if components.path.contains("post"),
           let idString = components.queryItems?.first(where: { urlQueryItem in
               urlQueryItem.name == "id"
           })?.value,
           let id = Int(idString) {
            return Deeplink.postDetails(id: id)
        }
        
        return nil
        
    }
    
    static func parseFromURLScheme(url: URL) -> Deeplink? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        
        // postsapp://post?id=10
        if components.host == "post",
           let idString = components.queryItems?.first(where: { urlQueryItem in
               urlQueryItem.name == "id"
           })?.value,
           let id = Int(idString) {
            return Deeplink.postDetails(id: id)
        }
        
        return nil
    }
}

class DeeplinkManager {
    
    static let shared = DeeplinkManager()
    
    var window: UIWindow?
    private var canHandle = false // va fi setat pe true in momentul in care viewcontroller-ul entry point va fi prezent pe ecran pentru a evita problemele cu deeplink-urile care vor declansa prezentare de modale mult prea devreme (nu e cazul pentru navigation controller)
    private var pendingDeeplink: Deeplink?
    
    func startDeeplinkHandling() {
        canHandle = true
        if let pendingDeeplink {
            self.pendingDeeplink = nil
            handleDeeplink(deeplink: pendingDeeplink)
        }
    }
    
    func handleDeeplink(deeplink: Deeplink) {
        guard canHandle else {
            self.pendingDeeplink = deeplink
            return
        }
        switch deeplink {
        case .postDetails(let id):
            showPost(id: id)
        }
    }
    
    private func showPost(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "PostDetailsController") as! PostDetailsController
        controller.postId = id
        let rootViewController = self.window?.rootViewController
        if let alreadyPresentedController = rootViewController?.presentedViewController {
            alreadyPresentedController.dismiss(animated: true) {
                rootViewController?.present(controller, animated: true)
            }
        } else {
            rootViewController?.present(controller, animated: true)
        }
    }
}
