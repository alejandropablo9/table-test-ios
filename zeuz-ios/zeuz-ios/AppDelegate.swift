//
//  AppDelegate.swift
//  zeuz-ios
//
//  Created by Jesus Alejandro Pablo Ojeda on 03/06/22.
//
import UIKit
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    /// Variable que define la pantalla principal.
    var window: UIWindow?
    /// Variable para hacer referencia a la barra de navegación.
    var navigationController: UINavigationController?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let firstView: UIViewController = ZTableVC.init()
        navigationController = UINavigationController(rootViewController: firstView)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }
}
