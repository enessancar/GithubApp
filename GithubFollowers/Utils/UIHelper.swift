//
//  UIHelper.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit

enum UIHelper {
    static func createThreeColumnFlowLayout(view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 10
        let availableWidt = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidt / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = .init(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
