//
//  SearchVC.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit
import SnapKit

final class SearchVC: UIViewController {
    
    //MARK: - Properties
    private let logoImageView = UIImageView()
    private let usernameTextField = GFTextField()
    private let actionButton = GFButton(title: "Get Followers", backgroundColor: .systemGreen)
    
    var isUsernameEntered: Bool {
        !usernameTextField.text!.isEmpty
    }
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubviews(logoImageView, usernameTextField, actionButton)
        configureLogoImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameTextField.text = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func createDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(dismissVC))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissVC() {
        view.endEditing(true)
    }
    
    @objc private func pushFollowerListVC() {
        guard isUsernameEntered else {
            
        }
    }
    
    private func configureLogoImageView() {
        logoImageView.image = Images.ghLogo
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(200)
        }
    }
    
    private func configureTextField() {
        usernameTextField.delegate = self
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
    }
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        actionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-50)
            make.leading.trailing.height.equalTo(usernameTextField)
        }
    }
}


extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
