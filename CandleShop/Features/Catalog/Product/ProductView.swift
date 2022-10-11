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

  public var price = 600
  public var volume = 1

  public lazy var imageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "lavanda")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    addSubview(imageView)
    return imageView
  }()

  public lazy var pageControl: UIPageControl = {
    let pageControl = UIPageControl()
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.numberOfPages = 3
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.pageIndicatorTintColor = K.Colors.lightBackground
    return pageControl
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

  public lazy var mlStackView: UIStackView = {
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

  public lazy var priceStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fill
    stackView.spacing = 18
    stackView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)
    return stackView
  }()

  public lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "600 ₽"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    addSubview(label)
    return label
  }()

  public lazy var minusButton: UIButton = {
  let button = UIButton(type: .custom)
    button.layer.cornerRadius = 0.5 * 30
    button.clipsToBounds = true
    button.tag = 1
    button.addTarget(self, action:#selector(changeVolumeButton), for: .touchUpInside)
  button.backgroundColor = K.Colors.lightBackground
    button.snp.makeConstraints { make in
      make.width.equalTo(30)
      make.height.equalTo(30)
    }
    return button
  }()

  public lazy var minusLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "-"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 20, weight: .light)
    return label
  }()


  public lazy var amountLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "1"
    label.isUserInteractionEnabled = false
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 22, weight: .light)
    return label
  }()

  public lazy var plusLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "+"
    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 20, weight: .light)
    return label
  }()

  public lazy var plusButton: UIButton = {
  let button = UIButton(type: .custom)
    button.layer.cornerRadius = 0.5 * 30
    button.clipsToBounds = true
    button.tag = 2
    button.addTarget(self, action:#selector(changeVolumeButton), for: .touchUpInside)
    button.backgroundColor = K.Colors.lightBackground
    button.snp.makeConstraints { make in
      make.width.equalTo(30)
      make.height.equalTo(30)
    }
    return button
  }()


  public lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Окунитесь в атмосферу французского Прованса. Аромат лаванды регенерирует, помогает расслабиться после тяжелого рабочего дня"
    label.isUserInteractionEnabled = false
    label.textColor = K.Colors.grayText
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
    addSubview(label)
    return label
  }()

  public lazy var fragranceLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.textColor = .white
    let amountText = NSMutableAttributedString.init(string: "Вид аромата:\nтравяной, пряный ")

    amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                  NSAttributedString.Key.foregroundColor: K.Colors.grayText],
                                 range: NSMakeRange(0, 12))

    label.attributedText = amountText
    label.numberOfLines = 0
    addSubview(label)
    return label
  }()

  public lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Пирамида аромата:"
    label.isUserInteractionEnabled = false
    label.textColor = K.Colors.grayText
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    addSubview(label)
    return label
  }()

  public lazy var topNotesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.textColor = .white
    let amountText = NSMutableAttributedString.init(string: "Верхние ноты: лимон, свежие, альдегиды")

    amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                  NSAttributedString.Key.foregroundColor: K.Colors.grayText],
                                 range: NSMakeRange(0, 13))

    label.attributedText = amountText
    label.numberOfLines = 0
    addSubview(label)
    return label
  }()

  public lazy var middleNotesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.textColor = .white
    let amountText = NSMutableAttributedString.init(string: "Средние ноты: апельсин, цветочные акценты")

    amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                  NSAttributedString.Key.foregroundColor: K.Colors.grayText],
                                 range: NSMakeRange(0, 13))

    label.attributedText = amountText
    label.numberOfLines = 0
    addSubview(label)
    return label
  }()


  public lazy var basicNotesLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.textColor = .white
    let amountText = NSMutableAttributedString.init(string: "Базовые ноты: ваниль, ноты специй")

    amountText.setAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12),
                                  NSAttributedString.Key.foregroundColor: K.Colors.grayText],
                                 range: NSMakeRange(0, 13))

    label.attributedText = amountText
    label.numberOfLines = 0
    addSubview(label)
    return label
  }()


  @objc func changeColorButton(sender: UIButton){
    for button in mlButtons {
      button.backgroundColor = K.Colors.lightBackground
    }
    sender.backgroundColor = K.Colors.darkBackground

    switch sender.tag {
      case 1:
      price = 600
      changePrice()
    case 2:
      price = 430
      changePrice()
    case 3:
      price = 300
      changePrice()
    case 4:
      price = 250
      changePrice()
      default:
      price = 1200
      changePrice()

    }
  }

  @objc func changeVolumeButton(sender: UIButton){

    print(sender.tag )
    switch sender.tag {
      case 1:
      if volume > 0 { volume = volume - 1}
      default:
      volume = volume + 1
    }
    changeVolume()
    changePrice()
  }


  private func changePrice(){
    priceLabel.text = "\(Int(price) * volume) ₽"
  }

  private func changeVolume(){
    amountLabel.text = "\(volume)"

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
    imageView.snp.makeConstraints { make in
      make.left.right.top.equalToSuperview()
      make.height.equalTo(250)
    }

    imageView.addSubview(pageControl)
    pageControl.snp.makeConstraints { make in
      make.bottom.centerX.equalToSuperview()
    }

    title.snp.makeConstraints { make in
      make.top.equalTo(imageView.snp.bottom).offset(20)
      make.left.equalToSuperview().offset(25)
    }

    mlStackView.snp.makeConstraints { make in
      make.top.equalTo(title.snp.bottom).offset(10)
      make.left.equalTo(title.snp.left)
      make.right.equalToSuperview().offset(-25)
    }

    for button in mlButtons {
      mlStackView.addArrangedSubview(button)
    }
    changeColorButton(sender: mlButtons[0])

    priceStackView.snp.makeConstraints { make in
      make.left.equalTo(mlStackView.snp.left)
      make.right.equalTo(mlStackView.snp.right)
      make.top.equalTo(mlStackView.snp.bottom).offset(35)
    }

    priceStackView.addArrangedSubview(priceLabel)

    priceStackView.addArrangedSubview(minusButton)
    minusButton.addSubview(minusLabel)
    minusLabel.snp.makeConstraints { make in
      make.centerY.centerX.equalToSuperview()
    }

    priceStackView.addArrangedSubview(amountLabel)
    priceStackView.addArrangedSubview(plusButton)
    plusButton.addSubview(plusLabel)
    plusLabel.snp.makeConstraints { make in
      make.centerY.centerX.equalToSuperview()
    }

    descriptionLabel.snp.makeConstraints { make in
      make.top.equalTo(priceStackView.snp.bottom).offset(20)
      make.left.equalTo(priceStackView.snp.left)
      make.right.equalTo(priceStackView.snp.right)
    }

    fragranceLabel.snp.makeConstraints { make in
      make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
      make.left.equalTo(descriptionLabel.snp.left)
      make.right.equalTo(descriptionLabel.snp.right)
    }

    subtitleLabel.snp.makeConstraints { make in
      make.top.equalTo(fragranceLabel.snp.bottom).offset(20)
      make.left.equalTo(descriptionLabel.snp.left)
      make.right.equalTo(descriptionLabel.snp.right)
    }

    topNotesLabel.snp.makeConstraints { make in
      make.top.equalTo(subtitleLabel.snp.bottom).offset(6)
      make.left.equalTo(descriptionLabel.snp.left)
      make.right.equalToSuperview()
    }

    middleNotesLabel.snp.makeConstraints { make in
      make.top.equalTo(topNotesLabel.snp.bottom).offset(6)
      make.left.equalTo(descriptionLabel.snp.left)
      make.right.equalToSuperview()
    }

    basicNotesLabel.snp.makeConstraints { make in
      make.top.equalTo(middleNotesLabel.snp.bottom).offset(6)
      make.left.equalTo(descriptionLabel.snp.left)
      make.right.equalToSuperview()
    }


  }


}

