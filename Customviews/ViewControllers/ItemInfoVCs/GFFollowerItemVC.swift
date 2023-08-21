//
//  GFFollowerItemVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 15.08.2023.
//

import UIKit

final class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(title: "Get Followers", backgroundColor: .systemGreen)
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(user: user)
    }
}
