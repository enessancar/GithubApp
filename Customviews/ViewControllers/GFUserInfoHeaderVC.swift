//
//  GFUserInfoHeaderVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 4.08.2023.
//

import UIKit
import SnapKit

final class GFUserInfoHeaderVC: UIViewController {
    
    var user: User!
    
    //MARK: - Properties
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel = GFTitleLabel(textALignment: .left, fontSize: 34)
    private let nameLabel = GFSecondaryLabel(fontSize: 18)
    private let locationImageView = UIImageView()
    private let locationLabel = GFSecondaryLabel(fontSize: 18)
    private let bioLabel = GFBodyLabel(textAlignment: .left)
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        view.addSubviews(avatarImageView, usernameLabel, nameLabel, locationImageView, locationLabel, bioLabel)
        layoutUI()
        configureUIElements()
    }
    
    private func layoutUI() {
        let padding: CGFloat = 20
        let textImagePadding: CGFloat = 12
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview()
            make.width.height.equalTo(90)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.top)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalToSuperview().offset(-textImagePadding)
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(textImagePadding)
            make.height.equalTo(18)
            make.trailing.equalToSuperview().offset(-textImagePadding)
            make.leading.equalTo(usernameLabel.snp.leading)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom)
            make.leading.equalTo(nameLabel.snp.leading)
            make.width.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.trailing.equalToSuperview().offset(textImagePadding)
            make.height.equalTo(20)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(textImagePadding)
            make.leading.equalTo(avatarImageView.snp.leading)
            make.trailing.equalToSuperview().offset(textImagePadding)
            make.height.equalTo(90)
        }
    }
    
    private func configureUIElements() {
        avatarImageView.downloadImage(urlString: user.avatarURL)
        
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? "N/A"
        locationLabel.text = user.location ?? "No Location"
        bioLabel.text = user.bio ?? "No bio avaliable"
        bioLabel.numberOfLines = 3
        
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
        
    }
}

