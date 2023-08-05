//
//  GFAvatarImageView.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit

final class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeHolderImage = Images.placeholder
    
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
