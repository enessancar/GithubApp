//
//  SearchVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 27.07.2023.
//

import UIKit
import SnapKit

final class SearchVC: UIViewController {

    //MARK: - Properties
    private let logoImageView = UIImageView()
    private let usernameTextField = GFTextField()
    let callToActionButton = GFButton(title: "Get Followers", backgroundColor: .systemGreen)
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureImageView()
        configureTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func pushFollowerListVC() {
        guard isUsernameEntered else { return }
        let followerListVC = FollowerListVC()
        followerListVC.username = usernameTextField.text
        followerListVC.title = usernameTextField.text
        navigationController?.pushViewController(followerListVC, animated: true)
    }
    
    private func configureImageView() {
        view.addSubview(logoImageView)
        logoImageView.image = UIImage(named: "gh-logo")
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }
    }
    
    private func configureTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(48)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
    }
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
        callToActionButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.leading.trailing.height.equalTo(usernameTextField )
        }
    }
}

extension SearchVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListVC()
        return true
    }
}
