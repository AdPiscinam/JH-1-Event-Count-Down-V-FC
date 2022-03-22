// AddEventCoordinator.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 21/03/2022
// 

import UIKit

final class AddEventCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let addEventViewController = AddEventViewController()
        addEventViewController.view.backgroundColor = .red
     //    navigationController.setViewControllers([eventListViewController], animated: false)
        let addEventViewModel = AddEventViewModel()
        addEventViewController.viewModel = addEventViewModel
        navigationController.present(addEventViewController, animated: true)
    }
    
    
    
}
