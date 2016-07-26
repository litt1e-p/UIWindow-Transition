//
//  AppDelegate.swift
//  UIWindow-Transition-Sample
//
//  Created by litt1e-p on 16/7/26.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = TabBarOneController()
        window?.makeKeyAndVisible()
        return true
    }
}