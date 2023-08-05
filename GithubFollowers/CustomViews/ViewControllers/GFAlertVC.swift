//
//  GFAlertVC.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit
import SnapKit

final class GFAlertVC: UIViewController {
    
    //MARK: - Properties
    private let containerView = GFAlertContainerView()
    private let titleLabel: GFTitleLabel = GFTitleLabel(textAlignment: .center, fontSize: 20)
    private let messageLabel: GFBodyLabel = GFBodyLabel(textAlignment: .center)
    private let actionButton: GFButton = GFButton(title: "Ok", backgroundColor: .systemPink)
    
    var alertTitle: String!
    var message: String!
    var buttonTitle: String!
    
    let padding: CGFloat = 20
    
    //MARK: - Init
    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        view.addSubviews(containerView, titleLabel, actionButton, messageLabel)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    private func configureContainerView() {
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(280)
        }
    }
    
    private func configureTitleLabel() {
        titleLabel.text = alertTitle
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(padding)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).offset(-padding)
            make.height.equalTo(28)
        }
    }
    
    private func configureActionButton() {
        actionButton.setTitle(buttonTitle, for: .normal)
        actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView.snp.bottom).offset(-padding)
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).offset(-padding)
            make.height.equalTo(44)
        }
    }
    
    private func configureMessageLabel() {
        messageLabel.text = message
        messageLabel.numberOfLines = 4
        messageLabel.lineBreakMode = .byTruncatingTail
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(actionButton)
            make.bottom.equalTo(actionButton.snp.top).offset(-12)
        }
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
