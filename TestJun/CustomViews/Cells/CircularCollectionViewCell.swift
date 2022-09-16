//
//  CircularCollectionViewCell.swift
//  TestJun
//
//  Created by Данила on 01.09.2022.
//

import UIKit
import SnapKit

class CircularCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(color: UIColor) {
        let container = UIView()
        container.backgroundColor = color
        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.center.equalTo(contentView.snp.center)
            make.height.equalTo(71)
            make.width.equalTo(71)
        }
        let img = UIImageView(image: UIImage(named: "Books"))
        container.addSubview(img)
        img.snp.makeConstraints { make in
            make.height.equalTo(28.06)
            make.width.equalTo(21)
            make.center.equalTo(container.snp.center)
        }
        let label = UILabel()
        label.font = UIFont(name: "MarkPro-Medium", size: 12)
        label.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        label.text = "Books"
        contentView.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalTo(container.snp.bottom).inset(-7)
            make.centerX.equalTo(contentView.snp.centerX)
            make.bottom.equalTo(contentView.snp.bottom)
        }
        container.layer.cornerRadius = 35.5
    }
}
