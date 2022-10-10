//
//  CatalogView.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit
//import SnapKit

enum Volume: String, CaseIterable {
  case ml250 = "250 мл"
  case ml190 = "190 мл"
  case ml100 = "100 мл"
  case ml50 = "50 мл"
  case coconut = "В кокосе"
}

class ProductView: UIView {


  public lazy var logoView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "lavanda")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    addSubview(imageView)
    return imageView
  }()


  public lazy var title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Свеча “Лаванда”"
    label.textColor = K.Colors.title
    label.font = UIFont.systemFont(ofSize: 22, weight: .light)
    addSubview(label)
    return label
  }()

  public lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 5
    stackView.distribution = .equalCentering
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)
    return stackView
  }()

  private lazy var mlButtons: [UIButton] = {
    var buttonArray = [UIButton]()
    var tag = 1
    for item in Volume.allCases {
      let button = UIButton()
      button.tag = tag
      tag += 1
      button.backgroundColor = K.Colors.lightBackground
      button.setTitle(item.rawValue, for: .normal)
      button.setTitleColor(UIColor.white, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 11)
     button.translatesAutoresizingMaskIntoConstraints = false
      button.addTarget(self, action:#selector(changeColorButton), for: .touchUpInside)
      button.clipsToBounds = true
      button.layer.cornerRadius = 10
     button.snp.makeConstraints { make in
       make.width.equalTo(54)
       make.height.equalTo(22)
     }
      buttonArray.append(button)
    }
    return buttonArray
  }()


  @objc func changeColorButton(sender: UIButton){
    for button in mlButtons {
      button.backgroundColor = K.Colors.lightBackground
    }
    sender.backgroundColor = K.Colors.darkBackground
  }



  public init() {
    super.init(frame: .zero)
    setup()
  }

  @available(*, unavailable)
  public required init?(coder aDecoder: NSCoder) {
    fatalError("Using xib files is prohibited")
  }

  func setup() {

    logoView.snp.makeConstraints { make in
      make.left.right.top.equalToSuperview()
      make.height.equalTo(250)
    }

    title.snp.makeConstraints { make in
      make.top.equalTo(logoView.snp.bottom).offset(20)
      make.left.equalToSuperview().offset(25)
    }

    stackView.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(10)
      make.left.equalTo(title.snp.left)
      make.right.equalToSuperview().offset(-25)
    }

    for button in mlButtons {
      stackView.addArrangedSubview(button)
    }
    changeColorButton(sender: mlButtons[0])


  }


}

