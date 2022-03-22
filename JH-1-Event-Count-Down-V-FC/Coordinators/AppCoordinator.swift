// AppCoordinator.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 20/03/2022
// 

import Foundation
import UIKit
//1


protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
}

final class AppCoordinator: Coordinator {
   
    private(set) var childCoordinators: [Coordinator] = []
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventListCoordinator)
        
        eventListCoordinator.start()
        print(childCoordinators)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}

