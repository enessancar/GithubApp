//
//  UIView+Ext.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 5.08.2023.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
