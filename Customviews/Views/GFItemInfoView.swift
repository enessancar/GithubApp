//
//  GFItemInfoView.swift
//  GithubApp
//
//  Created by Enes Sancar on 15.08.2023.
//

import UIKit
import SnapKit

enum ItemInfoType {
    case repos, gists, followers, following
}

final class GFItemInfoView: UIView {
    
    //MARK: - Properties
    private let symbolImageView = UIImageView()
    private let titleLabel = GFTitleLabel(textALignment: .left, fontSize: 14)
    private let countLabel = GFTitleLabel(textALignment: .left, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        addSubviews(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor   = .label
        
        symbolImageView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(symbolImageView.snp.centerY)
            make.leading.equalTo(symbolImageView.snp.trailing).offset(12)
            make.trailing.equalToSuperview()
            make.height.equalTo(18)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.centerX.equalTo(titleLabel.snp.centerX)
            make.height.equalTo(18)
        }
    }
    
    func set(itemInfoType: ItemInfoType, withCount count: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbols.repos
            titleLabel.text = "Public Repos"
            
        case .gists:
            symbolImageView.image = SFSymbols.gists
            titleLabel.text = "Public Gists"
        case .followers:
            symbolImageView.image = SFSymbols.followers
            titleLabel.text = "Followers"
        case .following:
            symbolImageView.image = SFSymbols.following
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
}
