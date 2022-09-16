//
//  HotSalesCollectionViewCell.swift
//  TestJun
//
//  Created by Данила on 02.09.2022.
//

import UIKit
import SnapKit

class HotSalesCollectionViewCell: UICollectionViewCell {
    let modelName = UILabel()
    let imageNew = UIView()
    let descriptionLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        let container = UIView()
        contentView.addSubview(container)
        container.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(contentView)
        }
        let rootImage = UIImageView()
        rootImage.load(link: "https://img.ibxk.com.br/2020/09/23/23104013057475.jpg")
        container.addSubview(rootImage)
        rootImage.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(container)
        }
        rootImage.layer.cornerRadius = 20
        rootImage.layer.masksToBounds = true
        newImage()
        setupModelAnddescription()
        setupBuyButton()
        
    }

    private func newImage() {
        contentView.addSubview(imageNew)
        imageNew.snp.makeConstraints { make in
            make.leading.equalTo(contentView).inset(32)
            make.top.equalTo(contentView).inset(20)
            make.width.height.equalTo(27)
        }
        imageNew.layer.cornerRadius = 13.5
        imageNew.backgroundColor = UIColor(red: 1, green: 0.429, blue: 0.304, alpha: 1)
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "New"
        imageNew.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalTo(imageNew.snp.center)
        }
    }

    private func setupModelAnddescription() {
        contentView.addSubview(modelName)
        modelName.text = "Iphone 12"
//        modelName.font = UIFont(name: "SFProDisplay-Bold", size: 25)
        modelName.font = UIFont.boldSystemFont(ofSize: 25)
        modelName.adjustsFontSizeToFitWidth = true
        modelName.minimumScaleFactor = 0.5
        modelName.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        modelName.snp.makeConstraints { make in
            make.top.equalTo(imageNew.snp.bottom).inset(-18)
            make.leading.equalTo(contentView).inset(30)
        }
        descriptionLabel.font = UIFont.systemFont(ofSize: 10)
        descriptionLabel.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        descriptionLabel.text = "Súper. Mega. Rápido."
        contentView.addSubview(descriptionLabel)
    descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(modelName.snp.bottom).inset(-5)
            make.leading.equalTo(contentView).inset(30)
        }
        
    }

    private func setupBuyButton() {
        let button = UIButton()
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).inset(-26)
            make.leading.equalTo(contentView).inset(30)
            make.width.equalTo(98)
            make.height.equalTo(23)
        }
        button.layer.cornerRadius = 3
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let labelButton = UILabel()
        button.addSubview(labelButton)
        labelButton.snp.makeConstraints { make in
            make.center.equalTo(button.snp.center)
        }
        labelButton.font = UIFont.boldSystemFont(ofSize: 11)
        labelButton.textColor = UIColor(red: 0.004, green: 0, blue: 0.208, alpha: 1)
        labelButton.text = "Buy now!"
    }
}
