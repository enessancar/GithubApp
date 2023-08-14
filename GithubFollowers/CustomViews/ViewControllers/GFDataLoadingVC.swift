//
//  GFDataLoadingVC.swift
//  GithubFollowers
//
//  Created by Enes Sancar on 6.08.2023.
//

import UIKit
import SnapKit

class GFDataLoadingVC: UIViewController {
    
    private var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) {
            self.containerView.alpha = 0.8
        }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingVC() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }
    
    func showEmptyStateView(message: String, view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.frame = view.frame  
        view.addSubview(emptyStateView)
    }
}
