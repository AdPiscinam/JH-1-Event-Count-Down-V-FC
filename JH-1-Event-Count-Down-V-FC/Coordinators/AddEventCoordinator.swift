// AddEventCoordinator.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 21/03/2022
// 

import UIKit

final class AddEventCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController
    var parentCoordinator: EventListCoordinator?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let modalNavigationController = UINavigationController()
        
        let addEventViewController = AddEventViewController()
        modalNavigationController.setViewControllers([addEventViewController], animated: false)
     //    navigationController.setViewControllers([eventListViewController], animated: false)
        let addEventViewModel = AddEventViewModel()
        addEventViewModel.coordinator = self 
        addEventViewController.viewModel = addEventViewModel
        
        navigationController.present(modalNavigationController, animated: true)
     
    }
    
    func didFinishAddEvent() {
        parentCoordinator?.childDidFinish(self)
    }
    
}
