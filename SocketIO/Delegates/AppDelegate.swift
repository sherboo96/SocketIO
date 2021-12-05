//
//  AppDelegate.swift
//  SocketIO
//
//  Created by Mahmoud Sherbeny on 04/10/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.rootViewController = TestVC()
        window?.makeKeyAndVisible()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        SocketService.instance.establishSocketIO()
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        SocketService.instance.stopSocketIO()
    }
}

