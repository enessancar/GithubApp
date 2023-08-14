//
//  FollowerCell.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit
import SnapKit

final class FollowerCell: UICollectionViewCell {
    static let identifier = "FollowerCell"
    
    //MARK: - Properties
    let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel   = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func set(follower: Follower) {
        avatarImageView.downloadImage(urlString: follower.avatarURL)
        usernameLabel.text = follower.login
    }
    
    private func configure() {
        addSubviews(avatarImageView, usernameLabel)
        let padding: CGFloat = 8
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(padding)
            make.height.equalTo(avatarImageView.snp.width)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView).offset(12)
            make.leading.equalToSuperview().offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(20)
        }
    }
}
