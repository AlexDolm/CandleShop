//
//  CatalogView.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit
//import SnapKit



class ProductView: UIView {

  public lazy var logoView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "lavanda")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFill
    addSubview(imageView)
    return imageView
  }()

  public lazy var title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Свеча “Лаванда”"
    label.textColor = K.Colors.title
    label.font = UIFont.systemFont(ofSize: 16)
    addSubview(title)
    return label
  }()



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
      make.height.equalTo(200)
    }




  }


}

