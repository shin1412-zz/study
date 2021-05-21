//
//  AppDelegate.swift
//  DesignPattern
//
//  Created by Huong Nguyen on 19/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(ofType: FirstViewController.self)
        let navigationVC = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }

}

