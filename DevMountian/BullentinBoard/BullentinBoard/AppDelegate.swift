//
//  AppDelegate.swift
//  BullentinBoard
//
//  Created by Taylor Phillips on 2/28/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (success, error) in
            if let error = error {
                NSLog("Error requestion authoriztation for notifications:\n\(error)")
                return
            }
        }
        UIApplication.shared.registerForRemoteNotifications()
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        PostController.shared.subcribeToPushNotification()
    }
    func application(_application: UIApplication, didFailToRegisterForRemoteNotificatonsWithError error: Error) {
        NSLog("Error registering for remote notification:\n\(error)")
    }
    func application(_application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        PostController.shared.refreshData()
    }

}

