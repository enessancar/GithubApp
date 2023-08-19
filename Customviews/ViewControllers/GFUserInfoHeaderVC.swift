//
//  GFUserInfoHeaderVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 4.08.2023.
//

import UIKit
import SnapKit

final class GFUserInfoHeaderVC: UIViewController {
    
    //MARK: - Properties
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel = GFTitleLabel(textALignment: .left, fontSize: 34)
    private let nameLabel = GFSecondaryLabel(fontSize: 18)
    private let locationImageView = UIImageView()
    private let locationLabel = GFSecondaryLabel(fontSize: 18)
    private let bioLabel = GFBodyLabel(textAlignment: .left)
    
    private let padding: CGFloat = 20
    private let textImagePadding: CGFloat = 12
    
    var user: User!
    
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
        configureLayout()
        configureUIElements()
    }
    
    private func configureUIElements() {
        avatarImageView.downloadImage(urlString: user.avatarURL)
        usernameLabel.text = user.login
        nameLabel.text = user.name ?? "No name available"
        locationLabel.text = user.location ?? "No location"
        
        locationImageView.image = SFSymbols.location
        locationImageView.tintColor = .secondaryLabel
        
        bioLabel.text = user.bio ?? "No bio avaiable"
        bioLabel.numberOfLines = 3
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        view.addSubviews(avatarImageView, usernameLabel, nameLabel, locationImageView)
        view.addSubviews(locationLabel, bioLabel)
    }
    
    private func configureLayout() {
        avatarImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(padding)
            make.leading.equalToSuperview()
            make.width.height.equalTo(90)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.top)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalToSuperview()
            make.height.equalTo(38)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(avatarImageView.snp.centerY).offset(8)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        locationImageView.snp.makeConstraints { make in
            make.bottom.equalTo(avatarImageView.snp.bottom)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(textImagePadding)
            make.height.width.equalTo(20)
        }
        
        locationLabel.snp.makeConstraints { make in
            make.leading.equalTo(locationImageView.snp.trailing).offset(5)
            make.centerY.equalTo(locationImageView.snp.centerY)
            make.trailing.equalToSuperview()
            make.height.equalTo(20)
        }
        
        bioLabel.snp.makeConstraints { make in
            make.top.equalTo(avatarImageView.snp.bottom).offset(textImagePadding)
            make.leading.equalTo(avatarImageView.snp.trailing)
            make.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
    }
}
