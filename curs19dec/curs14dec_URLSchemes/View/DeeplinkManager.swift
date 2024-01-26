//
//  DeeplinkManager.swift
//  curs14dec_URLSchemes
//
//  Created by Vlad Groza on 19.12.2023.
//

import Foundation
import UIKit

enum DeepLink {
    case postDetails(id: Int)
    
    static func parseFrom(url: URL) -> DeepLink? {
        guard let components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return nil
        }
        if components.host == "post",
           let idString = components.queryItems?.first(where: {
               urlQueryItem in
               urlQueryItem.name == "id"
           })?.value,
           let id = Int(idString) {
            return .postDetails(id: id)
        }
         
        return nil
    }
}

class DeeplinkManager {
    static let shared = DeeplinkManager()
    
    private var canHandle = false
    private var pendingDeeplink: DeepLink?
    var window: UIWindow?
    
    func handleDeepLink(deeplink: DeepLink) {
        guard canHandle else {
            self.pendingDeeplink = deeplink
            return
        }
        switch deeplink {
        case .postDetails(let id):
            showPost(id: id)
        }
    }
    
    func setCanHandleAsTrue() {
        canHandle = true
        if let pendingDeeplink {
            self.pendingDeeplink = nil
            handleDeepLink(deeplink: pendingDeeplink)
        }
    }
    
    private func showPost(id: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            let controller = storyboard.instantiateViewController(withIdentifier: "PostDetailsController") as! PostDetailsController
            controller.postId = id
            self.window?.rootViewController?.present(controller, animated: true)
        }
    }
}
