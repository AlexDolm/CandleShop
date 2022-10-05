//
//  CatalogView.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit
import SnapKit


final class CatalogView: UIView {
  public lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "S.subtitle"
   // label.backgroundColor = .orange
    addSubview(label)
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
    subtitleLabel.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.top.equalToSuperview()
      make.bottom.equalToSuperview()
    }
//    buttonsStackView.snp.makeConstraints { make in
//      make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
//      make.leading.equalTo(snp.leadingMargin)
//      make.trailing.equalTo(snp.trailingMargin)
//    }
//    footerView = addFooter()
//    footerView.helpLinkButton.typographyTitle = S.HelpLink.text
  }
}
