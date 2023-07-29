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
        navigationController?.isNavigationBarHidden = false
    }
}
