//
//  BottomSheetView.swift
//  TestJun
//
//  Created by Данила on 21.09.2022.
//

import UIKit
import SnapKit

class BottomSheetView: UIViewController {

    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.alpha = maxDimmedAlpha
        return view
    }()

    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        button.setImage(UIImage(named: "closeImage"), for: .normal)
        button.addTarget(self, action: #selector(closeBottomSheet), for: .touchUpInside)
        return button
    }()

    lazy var titleName: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.attributedText = NSMutableAttributedString(string: "Filter options", attributes: [NSAttributedString.Key.kern: -0.33])
        return label
    }()

    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(doneButtonTouch), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.titleLabel?.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        button.setTitle("Done", for: .normal)
        return button
    }()
    
    let contantHeight: CGFloat = 2.536
    
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        containerView.addSubview(closeButton)
        containerView.addSubview(titleName)
        containerView.addSubview(doneButton)

        setupContainerConstraints()
        setupButton()
        setupTitleName()
        setupDoneButton()
    }

    private func setupContainerConstraints() {
        dimmedView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(view)
        }
        containerView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view)
            make.height.equalTo(view.bounds.height/contantHeight)
            make.bottom.equalTo(view)
        }
    }

    private func setupButton() {
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(24)
            make.leading.equalTo(containerView).inset(44)
            make.width.height.equalTo(37)
        }
        closeButton.imageView?.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(closeButton).inset(13)
        }
    }

    private func setupTitleName() {
        titleName.snp.makeConstraints { make in
            make.centerX.equalTo(containerView.snp.centerX)
            make.top.equalTo(containerView).inset(31)
            make.width.equalTo(114)
            make.height.equalTo(23)
        }
    }

    private func setupDoneButton() {
        doneButton.snp.makeConstraints { make in
            make.leading.equalTo(titleName.snp.trailing).inset(-44)
            make.top.equalTo(containerView).inset(24)
            make.width.equalTo(86)
            make.height.equalTo(37)
        }
    }
}

extension BottomSheetView {
    @objc
    private func closeBottomSheet(_ sender: UIButton) {
        self.dismiss(animated: true)
    }

    @objc
    private func doneButtonTouch(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
