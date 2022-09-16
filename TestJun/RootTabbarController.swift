//
//  RootTabbarController.swift
//  TestJun
//
//  Created by Данила on 15.09.2022.
//

import UIKit
import SnapKit

class RootTabbarController: UITabBarController, UITabBarControllerDelegate {
    lazy var circularView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.snp.makeConstraints { make in
            make.height.width.equalTo(8)
        }
        view.layer.cornerRadius = 4
        return view
    }()

    private let leftView = UIButton()
    private let storeButton = UIButton()
    private let likeButton = UIButton()
    private let profileButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.selectedIndex = 0
        self.viewControllers = [HomeViewModule.setupHomeView(), UIViewController(), UIViewController()]
        tabbarSettings()
        setupLeftButton()
        setupStoreImage()
        setupLikeImage()
        setupProfileImage()
        self.view.layoutIfNeeded()
    }
    override func viewDidLayoutSubviews() {
        tabBar.frame = CGRect(x: 0, y: self.view.bounds.height-72, width: tabBar.frame.size.width, height: 72)
        super.viewDidLayoutSubviews()
      }

    func tabbarSettings() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 36
        self.tabBar.barTintColor = UIColor(red: 0.004, green: 0, blue: 0.15, alpha: 1)
        self.tabBar.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.15, alpha: 1)
    }
}


extension RootTabbarController {
    private func setupLeftButton() {
        self.tabBar.addSubview(leftView)
        leftView.snp.makeConstraints { make in
            make.top.equalTo(self.tabBar.snp.top).inset(26)
            make.leading.equalTo(self.tabBar.snp.leading).inset(68)
            make.width.equalTo(75)
            make.height.equalTo(19)
        }

        leftView.addSubview(circularView)
        circularView.snp.makeConstraints { make in
            make.centerY.equalTo(leftView.snp.centerY)
            make.leading.equalTo(leftView)
        }

        let label = UILabel()
        label.textColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Explorer"
        leftView.addSubview(label)
        label.snp.makeConstraints { make in
            make.leading.equalTo(circularView.snp.trailing).inset(-7)
            make.top.equalTo(leftView)
            make.trailing.equalTo(leftView)
            make.bottom.equalTo(leftView)
        }

        leftView.addTarget(self, action: #selector(changeToExplorer), for: .touchUpInside)
    }

    @objc
    private func changeToExplorer(_ sender: UIButton) {
        self.selectedIndex = 0
    }

    private func setupStoreImage() {
        self.tabBar.addSubview(storeButton)
        storeButton.snp.makeConstraints { make in
            make.leading.equalTo(leftView.snp.trailing).inset(-47)
            make.centerY.equalTo(leftView.snp.centerY)
            make.width.height.equalTo(18)
        }
        storeButton.setImage(UIImage(named: "StoreImage"), for: .normal)
        storeButton.addTarget(self, action: #selector(changeToStore), for: .touchUpInside)
    }

    @objc
    private func changeToStore(_ sender: UIButton) {
        self.selectedIndex = 1
    }

    private func setupLikeImage() {
        self.tabBar.addSubview(likeButton)
        likeButton.snp.makeConstraints { make in
            make.leading.equalTo(storeButton.snp.trailing).inset(-52.46)
            make.centerY.equalTo(storeButton.snp.centerY)
            make.width.equalTo(19)
            make.height.equalTo(17)
        }
        likeButton.setImage(UIImage(named: "likeImage"), for: .normal)
        likeButton.addTarget(self, action: #selector(changeToLiked), for: .touchUpInside)
    }

    @objc
    private func changeToLiked(_ sender: UIButton) {
        self.selectedIndex = 2
    }

    private func setupProfileImage() {
        self.tabBar.addSubview(profileButton)
        profileButton.snp.makeConstraints { make in
            make.leading.equalTo(likeButton.snp.trailing).inset(-52)
            make.centerY.equalTo(likeButton.snp.centerY)
            make.width.equalTo(17.01)
            make.height.equalTo(17.57)
        }
        profileButton.setImage(UIImage(named: "ProfileIcon"), for: .normal)
        profileButton.addTarget(self, action: #selector(changeToProfile), for: .touchUpInside)
    }

    @objc
    private func changeToProfile(_ sender: UIButton) {
        self.selectedIndex = 3
    }
}
