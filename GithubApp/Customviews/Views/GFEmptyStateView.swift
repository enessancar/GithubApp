//
//  GFEmptyStateView.swift
//  GithubApp
//
//  Created by Enes Sancar on 1.08.2023.
//

import UIKit

final class GFEmptyStateView: UIView {
    
    //MARK: - Properties
    private let messageLabel = GFTitleLabel(textALignment: .center, fontSize: 28)
    private let logoImageView = UIImageView()
    
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
            make.centerY.equalToSuperview().offset(-130)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(200)
        }
    }
    
    private func configureLogoImageView() {
        logoImageView.image = Images.emptyStateLogo
        
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalToSuperview().multipliedBy(1.3)
            make.trailing.equalTo(snp.trailing).offset(140)
            make.bottom.equalTo(snp.bottom).offset(55)
        }
    }
}
