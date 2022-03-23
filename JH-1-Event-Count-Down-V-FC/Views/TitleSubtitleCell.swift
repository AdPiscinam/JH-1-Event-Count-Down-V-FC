// TitleSubtitleCell.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 22/03/2022
// 

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    private let titleLabel = UILabel()
    let subtitleTextfield = UITextField()
    private let constant: CGFloat = 15
    
    private let datePickerView = UIPickerView()
    private let toolbar = UIToolbar()
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
    }()
    
    private let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextfield.text = viewModel.subtitle
        subtitleTextfield.placeholder = viewModel.placeholder
        subtitleTextfield.inputView = viewModel.type == .text ? nil : datePickerView
    }
    
    private func setupViews() {
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextfield.font = .systemFont(ofSize: 20, weight: .medium)
        
        [titleLabel, subtitleTextfield].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextfield)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: constant),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: constant),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: constant),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -constant)
        ])
    }
    
    @objc private func tappedDone() {
        print("Done tapped")
    }
}
