//
//  UserInfoVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 28.07.2023.
//

import UIKit

final class UserInfoVC: UIViewController {

    var username: String!
    
    init(username: String!) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        
        NetworkManager.shared.getUserInfo(for: username) { result in
            switch result {
            case .success(let success):
                print(success.bio)
            case .failure(let failure):
                self.presentGFAlert(title: "Something went wrong", message: failure.localizedDescription, buttonTitle: "Ok")
            }
        }
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}

