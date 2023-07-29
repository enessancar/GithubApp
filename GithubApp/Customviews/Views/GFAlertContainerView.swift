//
//  GFAlertContainerView.swift
//  GithubApp
//
//  Created by Enes Sancar on 29.07.2023.
//

import UIKit

final class GFAlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .systemBackground
    }
}
