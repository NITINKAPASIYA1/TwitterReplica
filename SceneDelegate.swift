//
//  SceneDelegate.swift
//  VistsDemo
//
//  Created by Nitin on 04/03/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MapViewController()
        window?.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }



}

