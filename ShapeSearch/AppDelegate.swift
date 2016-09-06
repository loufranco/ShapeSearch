//
//  AppDelegate.swift
//  ShapeSearch
//
//  Created by Lou Franco on 9/5/16.
//  Copyright © 2016 Lou Franco. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = ShapeViewController()
        //self.window?.rootViewController = SingleShapeViewController()
        self.window?.makeKeyAndVisible()

        return true
    }

}

