// EventListViewModel.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 21/03/2022
// 

import Foundation

final class EventListViewModel {
    var title = "Events"
    
    var coordinator: EventListCoordinator?
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
}
