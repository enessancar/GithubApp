//
//  FollowerListVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 28.07.2023.
//

import UIKit

final class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { result in
            switch result {
            case .success(let success):
                print(success.count)
                print(success)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
