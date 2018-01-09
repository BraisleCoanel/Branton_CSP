//
//  AppDelegate.swift
//  Branton_CSP
//
//  Created by Martinson, Branton on 10/26/17.
//  Copyright © 2017 Martinson, Branton. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        // Override point for customization after application launch.
        
        if let splitViewController = window!.rootViewController as? UISplitViewController
        {
            let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count - 1] as! UINavigationController
            
            navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            splitViewController.delegate = self
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {    }

    func applicationDidEnterBackground(_ application: UIApplication) {    }

    func applicationWillEnterForeground(_ application: UIApplication) {    }

    func applicationDidBecomeActive(_ application: UIApplication) {    }

    func applicationWillTerminate(_ application: UIApplication) {    }

    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController : UIViewController,
                             onto primaryViewController : UIViewController) -> Bool
    {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? InternetDetailViewController else { return false }
        if topAsDetailController.detailAddress == nil
        {
            return true
        }
        return false
    }

}

