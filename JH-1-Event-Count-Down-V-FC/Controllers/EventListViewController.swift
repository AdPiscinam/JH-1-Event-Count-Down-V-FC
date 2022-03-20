// EventListViewController.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 20/03/2022
// 

import UIKit

class EventListViewController: UIViewController {
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    //MARK: - Instantiate Method
    
    //MARK: Private Methods
    private func setupUI() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedRightBarButton() {
        print("tapped")
    }
}

