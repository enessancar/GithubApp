//
//  GFTabBarController.swift
//  GithubApp
//
//  Created by Enes Sancar on 27.07.2023.
//

import UIKit

final class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTabBar()
        configureNavigationBar()
    }
    
    private func configureView() {
        viewControllers = [
            createNavController(for: SearchVC(), title: "Search", imageName: "magnifyingglass"),
            createNavController(for: FavoritesListVC(), title: "Favorites", imageName: "star.fill")
        ]
    }
    
    private func configureTabBar() {
        UITabBar.appearance().tintColor = .systemGreen
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        } else {
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
    }
    
    private func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = .systemGreen
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithDefaultBackground()
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    private func createNavController(for viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        return navController
    }
}
