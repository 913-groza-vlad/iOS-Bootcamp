//
//  PushNotificationService.swift
//  curs16ian_push-notification
//
//  Created by Vlad Groza on 16.01.2024.
//

import Foundation
import UIKit
import UserNotifications

class PushNotificationService: NSObject {
    static let instance = PushNotificationService()
    
    private override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    func registerForPushNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, _ in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .badge, .sound])
        
//        let alert = UIAlertController(title: notification.request.content.title, message: notification.request.content.body, preferredStyle: .alert)
//
//        let okButton = UIAlertAction(title: "OK", style: .default)
//        alert.addAction(okButton)
//        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
//        sceneDelegate.window?.rootViewController?.present(alert, animated: true)
//        completionHandler([])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("dummy")
        let userInfo = response.notification.request.content.userInfo
        if let aps = userInfo["aps"] as? [String: Any],
           let deeplink = aps["deeplink"] as? String {
            print(deeplink)
        }
    }
    
    
    
}

extension PushNotificationService: UNUserNotificationCenterDelegate {
    
}
