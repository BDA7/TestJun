//
//  SearchCollectionViewCell.swift
//  TestJun
//
//  Created by Данила on 02.09.2022.
//

import UIKit
import SnapKit

class SearchCollectionViewCell: UICollectionViewCell {
    let textField = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        setupSearchBar()
        let rightButton = UIButton()
        contentView.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.height.width.equalTo(34)
            make.left.equalTo(textField.snp.right).inset(-11)
        }
        rightButton.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        rightButton.layer.cornerRadius = 17
        
        let imageButton = UIImageView(image: UIImage(named: "rightSearchButton"))
        rightButton.addSubview(imageButton)
        imageButton.snp.makeConstraints { make in
            make.height.width.equalTo(14.78)
            make.center.equalTo(rightButton.snp.center)
        }
        
        
    }

    private func setupSearchBar() {
        contentView.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.left.equalTo(contentView).inset(32)
            make.width.equalTo(300)
            make.height.equalTo(34)
        }
        textField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        textField.layer.cornerRadius = 15
        textField.placeholder = "Search"
        if let imageTextField = UIImage(systemName: "magnifyingglass") {
            textField.setLeftView(image: imageTextField)
        }

    }
}

extension UITextField {
  func setLeftView(image: UIImage) {
    let iconView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20)) // set your Own size
    iconView.image = image
    let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
    iconContainerView.addSubview(iconView)
    leftView = iconContainerView
    leftViewMode = .always
    self.tintColor = .lightGray
  }
}
