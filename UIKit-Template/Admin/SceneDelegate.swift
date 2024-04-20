//
//  SceneDelegate.swift
//  UIKit-Template
//
//  Created by Cristina Arcodia on 4/19/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        //MARK: - Initial Entry
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: sceneWindow)
        window.makeKeyAndVisible()   
        
        let decisionController = HomeController()
        let navigationController = UINavigationController(rootViewController: decisionController)
        navigationController.navigationBar.isHidden = true
        navigationController.modalPresentationStyle = .fullScreen

        window.rootViewController = navigationController
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

