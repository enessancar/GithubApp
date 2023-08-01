//
//  GFAvatarImageView.swift
//  GithubApp
//
//  Created by Enes Sancar on 31.07.2023.
//

import UIKit

final class GFAvatarImageView: UIImageView {
    
    private let placeHolderImage = UIImage(named: "avatar-placeholder")!
    private let cache = NetworkManager.shared.cache
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeHolderImage
    }
    
    func downloadImage(urlString: String) {
        NetworkManager.shared.downloadImage(urlString: urlString) { [weak self] image in
            guard let self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
