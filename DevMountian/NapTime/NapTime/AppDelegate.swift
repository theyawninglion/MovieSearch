//
//  AppDelegate.swift
//  NapTime
//
//  Created by Taylor Phillips on 2/7/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(option)
       
        return true
    }
}
