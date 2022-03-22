// AddEventViewModel.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 21/03/2022
// 

import UIKit

final class AddEventViewModel {
    var coordinator: AddEventCoordinator?
   
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    

}
