//
//  GFEmptyStateView.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit
import SnapKit

final class GFEmptyStateView: UIView {
    
    let messageLabel = GFTitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func configure() {
        addSubviews(messageLabel, logoImageView)
        configureMessageLabel()
        configureLogoImageView()
    }
    
    private func configureMessageLabel() {
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        
        messageLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-120)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(200)
        }
    }
    
    private func configureLogoImageView() {
        logoImageView.image = Images.emptyStateLogo
        
        NSLayoutConstraint.activate([
            logoImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 60)
        ])
    }
}
