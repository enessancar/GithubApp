//
//  GFUserInfoHeaderVC.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit
import SnapKit

final class GFUserInfoHeaderVC: UIViewController {
    
    var user: User!
    
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel = GFTitleLabel(textAlignment: .left, fontSize: 34)
    private let nameLabel = GFSecondaryTitleLabel(fontSize: 18)
    private let locationImageView = UIImageView()
    private let locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    private let bioLabel = GFBodyLabel(textAlignment: .left)
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(avatarImageView, usernameLabel, nameLabel, locationImageView, locationLabel, bioLabel)
        layoutUI()
        configureUIElements()
    }
    
    private func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        avatarImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(padding)
            make.width.height.equalTo(90)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.top.equalTo(avatarImageView.snp.top)
            make.trailing.equalToSuperview().offset(-textImagePadding)
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(8)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalToSuperview().offset(-textImagePadding)
            make.height.equalTo(20)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.width.height.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.height.equalTo(20)
            make.trailing.equalToSuperview().offset(-padding)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(textImagePadding)
            make.leading.equalTo(avatarImageView.snp.leading)
            make.trailing.equalToSuperview().offset(-textImagePadding)
            make.height.equalTo(90)
        }
    }
    
    private func configureUIElements() {
        avatarImageView.downloadImage(urlString: user.avatarURL)
        usernameLabel.text = user.login
        nameLabel.text = user.name
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No Bio available"
        bioLabel.numberOfLines = 3
    }
}
