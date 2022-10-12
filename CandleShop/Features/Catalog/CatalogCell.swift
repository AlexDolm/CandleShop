//
//  CatalogCell.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit
import SnapKit

class CatalogCell: UITableViewCell {
  static let indetifireCell = "catalogCell"

  //static public var imageq = UIImage(named: "lavanda")

  public lazy var shadowView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.clipsToBounds = true
    view.layer.cornerRadius = 14
    view.backgroundColor = K.Colors.background
    view.clipsToBounds = false
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 0.3
    view.layer.shadowOffset = CGSize(width: 0, height: 8)
    view.layer.shadowRadius = 4
    return view
  }()

  public lazy var productView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "lavanda")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 14

    return imageView
  }()

  public lazy var title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Лаванда"
    label.textColor = K.Colors.titleMini
    label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
    return label
  }()

  public lazy var subtitle: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Окунитесь в атмосферу французского Прованса. Аромат лаванды регенерирует, помогает расслабиться после тяжелого рабочего дня"
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = K.Colors.subtitle
    label.font = UIFont.systemFont(ofSize: 11, weight: .medium)
    return label
  }()

  public lazy var volumeView: UIView = {
    let view = UIView()
    view.backgroundColor = K.Colors.darkBackground
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 9
    view.clipsToBounds = false
    return view
  }()

  public lazy var volumeLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "от 600 ₽"
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.textColor = K.Colors.title
    label.font = UIFont.systemFont(ofSize: 9, weight: .medium)
    return label
  }()

  public lazy var likeImage: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = K.Images.love
    imageView.image = imageView.image!.withRenderingMode(.alwaysTemplate)
    imageView.tintColor = K.Colors.darkBackground
    return imageView
  }()

  


  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.backgroundColor = K.Colors.background
    contentView.addSubview(shadowView)
    shadowView.addSubview(productView)
    contentView.addSubview(title)
    contentView.addSubview(subtitle)
    productView.addSubview(volumeView)
    volumeView.addSubview(volumeLabel)
    productView.addSubview(likeImage)
    setup()
  }

  func setup() {
    shadowView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.height.equalTo(180)
      make.left.equalToSuperview().offset(18)
      make.right.equalToSuperview().offset(-18)
    }

    productView.snp.makeConstraints { make in
      make.top.height.left.right.equalToSuperview()
    }

    title.snp.makeConstraints { make in
      make.top.equalTo(shadowView.snp.bottom).offset(14)
      make.left.equalTo(shadowView.snp.left).offset(14)
    }

    subtitle.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(4)
      make.left.equalTo(title.snp.left)
      make.right.equalTo(shadowView.snp.right).offset(-14)
    }

    volumeView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(12)
      make.left.equalToSuperview().offset(12)
      make.height.equalTo(18)
      make.width.equalTo(56)
    }

    volumeLabel.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()

    }

    likeImage.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(12)
      make.right.equalToSuperview().offset(-12)
      make.height.equalTo(18)
      make.width.equalTo(18)

    }

  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
