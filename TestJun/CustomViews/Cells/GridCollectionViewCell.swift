//
//  GridCollectionViewCell.swift
//  TestJun
//
//  Created by Данила on 03.09.2022.
//

import UIKit
import SnapKit

class GridCollectionViewCell: UICollectionViewCell {
    let mainImage = UIImageView()
    let price = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        contentView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        setupMainImage()
        setupPrices()
        setupModelName()
        contentView.layer.cornerRadius = 10
    }

    func setupMainImage() {
        contentView.addSubview(mainImage)
        mainImage.load(link: "https://www.benchmark.rs/assets/img/news/edge1.jpg")
        mainImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentView).inset(2)
            make.bottom.equalTo(contentView).inset(55)
        }
    }

    private func setupPrices() {
        contentView.addSubview(price)
        price.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).inset(-2)
            make.leading.equalTo(contentView).inset(21)
        }
        price.font = UIFont.boldSystemFont(ofSize: 16)
        price.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        price.text = "300"

        let discountPrice = UILabel()
        contentView.addSubview(discountPrice)
        discountPrice.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).inset(-8)
            make.leading.equalTo(price.snp.trailing).inset(-7)
        }
        discountPrice.textColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
        discountPrice.font = UIFont.boldSystemFont(ofSize: 10)
        let attributedText = NSAttributedString(
            string: "1,500",
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
        discountPrice.attributedText = attributedText
    }

    private func setupModelName() {
        let nameLabel = UILabel()
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(price.snp.bottom).inset(-5)
            make.left.equalTo(contentView).inset(21)
        }
        nameLabel.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 10)
        nameLabel.attributedText = NSMutableAttributedString(string: "Samsung Galaxy s20 Ultra", attributes: [NSAttributedString.Key.kern: -0.33])
    }
}
