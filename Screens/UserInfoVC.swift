//
//  UserInfoVC.swift
//  GithubApp
//
//  Created by Enes Sancar on 28.07.2023.
//

import UIKit
import SnapKit
import SafariServices

protocol UserInfoVCDelegate: AnyObject {
    func didTapGithubProfile(user: User)
    func didTapGetFollowers(user: User)
}

final class UserInfoVC: UIViewController {
    
    private let headerView  = UIView()
    private let itemViewOne = UIView()
    private let itemViewTwo = UIView()
    private let dateLabel   = GFBodyLabel(textAlignment: .center)
    private var itemViews: [UIView] = []
    
    private let padding: CGFloat = 20
    var username: String!
    
    weak var delegate: FollowerListVCDelegate!
    
    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        layutUI()
        getUserInfo()
    }
    
    private func configureVC() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    private func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(user: user)
                }
            case .failure(let error):
                self.presentGFAlert(title: "Something went wrong", message: error.localizedDescription, buttonTitle: "Ok")
            }
        }
    }
    
    private func configureUIElements(user: User) {
        let repoItemVC = GFRepoItemVC(user: user)
        repoItemVC.delegate = self
        
        let followerItemVC = GFFollowerItemVC(user: user)
        followerItemVC.delegate = self
        
        self.add(childVC: repoItemVC, to: self.itemViewOne)
        self.add(childVC: followerItemVC, to: self.itemViewTwo)
        self.add(childVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
        self.dateLabel.text = "GitHub Since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    private func layutUI() {
        itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
        for itemView in itemViews {
            view.addSubview(itemView)
            
            itemView.snp.makeConstraints { make in
                make.leading.equalToSuperview().offset(padding)
                make.trailing.equalToSuperview().offset(-padding)
            }
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(180)
        }
        
        itemViewOne.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(padding)
            make.height.equalTo(140)
        }
        
        itemViewTwo.snp.makeConstraints { make in
            make.top.equalTo(itemViewOne.snp.bottom).offset(padding)
            make.height.equalTo(140)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(itemViewTwo.snp.bottom).offset(padding)
            make.height.equalTo(18)
        }
    }
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
}

extension UserInfoVC: UserInfoVCDelegate {
    func didTapGithubProfile(user: User) {
        guard let url = URL(string: user.htmlURL) else {
            presentGFAlert(title: "Invalid Url", message: "The url attached to this user is invalid", buttonTitle: "Ok")
            return
        }
        presentSafariVC(url: url)
    }
    
    func didTapGetFollowers(user: User) {
        guard user.followers != 0 else {
            presentGFAlert(title: "No followers", message: "This user has no followeers. What's shame", buttonTitle: "So sad")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}
