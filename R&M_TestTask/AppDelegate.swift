// AppDelegate.swift
// R&M_TestTask. Created by Zlata Guseva.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _: UIApplication,
        didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupRootViewController()
        return true
    }

    private func setupRootViewController() {
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = CharactersViewController()
        let navigationVC = CustomNavigationController(rootViewController: viewController)
        window?.rootViewController = navigationVC
        window?.makeKeyAndVisible()
    }
}
