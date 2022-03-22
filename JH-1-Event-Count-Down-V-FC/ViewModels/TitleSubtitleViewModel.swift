// TitleSubtitleViewModel.swift
// JH-1-Event-Count-Down-V-FC
// Created by Ad Piscinam on 22/03/2022
// 

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
}
