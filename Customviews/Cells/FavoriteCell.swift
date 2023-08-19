//
//  FavoriteCell.swift
//  GithubApp
//
//  Created by Enes Sancar on 19.08.2023.
//

import UIKit
import SnapKit

final class FavoriteCell: UITableViewCell {
    static let reuseID = "FavoriteCell"
    
    //MARK: - Properties
    private let avatarImageView = GFAvatarImageView(frame: .zero)
    private let usernameLabel   = GFTitleLabel(textALignment: .left, fontSize: 26)
    
    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func set(favorite: Follower) {
        avatarImageView.downloadImage(urlString: favorite.avatarURL)
        usernameLabel.text = favorite.login
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 12
        
        avatarImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(padding)
            make.height.width.equalTo(60)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avatarImageView.snp.trailing).offset(padding)
            make.trailing.equalToSuperview().offset(-padding)
            make.height.equalTo(40)
        }
    }
}
