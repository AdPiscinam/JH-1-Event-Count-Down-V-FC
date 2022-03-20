// SceneDelegate.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 20/03/2022
// 

import UIKit
//2
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        /// 2. Create a new UIWindow using the windowScene constructor which takes in a window scene.
        let window = UIWindow(windowScene: windowScene)
        self.window = window
      
        /// 3. Create a view hierarchy programmatically
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
        
        
    }
}

