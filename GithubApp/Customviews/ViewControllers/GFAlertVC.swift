//
//  GFAlertVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 29.07.2023.
//

import UIKit
import SnapKit

final class GFAlertVC: UIViewController {
    
    //MARK: - Properties
    private let containerView = GFAlertContainerView()
    private let titleLabel =  GFTitleLabel(textALignment: .center, fontSize: 20)
    private let messageLabel = GFBodyLabel(textAlignment: .center)
    private let actionButton = GFButton(title: "Ok", backgroundColor: .systemPink)
    
    var alertTitle: String?
    var message: String?
    var buttonTitle: String?

    init(title: String, message: String, buttonTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.message = message
        self.buttonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let padding: CGFloat = 20
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        
        view.addSubviews(containerView, titleLabel, actionButton, messageLabel)
        configureContainerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    private func configureContainerView() {
        containerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(280)
            make.height.equalTo(220)
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
            make.leading.equalTo(containerView.snp.leading).offset(padding)
            make.trailing.equalTo(containerView.snp.trailing).offset(-padding)
            make.bottom.equalTo(actionButton.snp.top).offset(-12)
        }
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}
