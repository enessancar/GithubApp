//
//  GFRepoItemVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 15.08.2023.
//

import UIKit

final class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(title: "Github Profile", backgroundColor: .systemPurple)
    }
    
    override func actionButtonTapped() {
        delegate.didTapGithubProfile(user: user)
    }
}
