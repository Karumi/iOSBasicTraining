//
//  AppDelegate.swift
//  iOSBasicTraining
//
//  Created by Pedro Vicente Gomez on 24/06/16.
//  Copyright © 2016 GoKarumi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame:UIScreen.main.bounds)
        installRootViewControllerIntoWindow(window)
        configureWindow()
        configureNavigationBarStyle()
        window?.makeKeyAndVisible()
        return true
    }

    fileprivate func installRootViewControllerIntoWindow(_ window: UIWindow?) {
        let viewController = SuperHeroesDetectorServiceLocator.provideRootViewController()
        window?.rootViewController = viewController
    }

    fileprivate func configureWindow() {
        window?.backgroundColor = UIColor.windowBackgroundColor
    }

    fileprivate func configureNavigationBarStyle() {
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.barTintColor = UIColor.navigationBarColor
        navigationBarAppearance.tintColor = UIColor.navigationBarTitleColor
        navigationBarAppearance.isTranslucent = false
        navigationBarAppearance.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.navigationBarTitleColor
        ]
    }

}
