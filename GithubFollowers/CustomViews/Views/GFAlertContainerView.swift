//
//  GFAlertContainerView.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit

final class GFAlertContainerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
        backgroundColor = .systemBackground
    }
}
