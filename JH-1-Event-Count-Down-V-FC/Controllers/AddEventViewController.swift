// AddEventViewController.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 21/03/2022
// 

import UIKit

class AddEventViewController: UIViewController {
    
    
    var viewModel: AddEventViewModel!
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .cyan
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
        setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
        
    }
    
    
    
    @objc private func dismissEventViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func save() {
        viewModel.tappedDone()
    }
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        view.addSubview(tableView)
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // to force large titles
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false)
        tableView.contentInsetAdjustmentBehavior = .never
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        // Cancel Button
        let cancelBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismissEventViewController))
        cancelBarButtonItem.tintColor = .primary
        navigationItem.leftBarButtonItem = cancelBarButtonItem
        navigationItem.title = viewModel.title
       
        
        // Done Button
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
        doneBarButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = doneBarButtonItem
        navigationItem.title = viewModel.title
    }
    
    
}

extension AddEventViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel)
            cell.subtitleTextfield.delegate = self
            return cell
        case .titleImage:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}

extension AddEventViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else {
            return false
        }
        
        let text = currentText + string
        let point = textField.convert(textField.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            viewModel.updateCell(indexPath: indexPath, subtitle: text)
        }
        
       
        return true
    }
}
