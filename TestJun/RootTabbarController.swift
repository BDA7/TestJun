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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        self.selectedIndex = 1
        tabbarSettings()
        setupMiddleButton()
    }

    private func setupMiddleButton() {
        let leftView = UIView()
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

        self.view.layoutIfNeeded()
    }

    func tabbarSettings() {
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.barTintColor = UIColor(red: 0.004, green: 0, blue: 0.15, alpha: 1)
    }
}
