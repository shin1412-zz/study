//
//  AppDelegate.swift
//  SOLID
//
//  Created by Huong Nguyen on 21/05/2021.
//

import UIKit

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(ofType: SingleResponsibilityViewController.self)
        vc.setup(presenter: SinglePresenter(delegate: vc, usecase: SingleUseCase()))
        let navigationVC = UINavigationController(rootViewController: vc)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
        return true
    }

}
