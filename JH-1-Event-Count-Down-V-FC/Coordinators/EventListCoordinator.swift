// EventListCoordinator.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 20/03/2022
// 

import Foundation
import UIKit

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func start() {
        let eventListViewController = EventListViewController()
     //    navigationController.setViewControllers([eventListViewController], animated: true)
        navigationController.pushViewController(eventListViewController, animated: true)
    }
    
    
}
