//
//  CatalogView.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit


final class CatalogView: UIView {
  public lazy var subtitleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "S.subtitle"
    label.backgroundColor = .orange
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
     subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
     subtitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
     subtitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
     subtitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
     subtitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
     
//    subtitleLabel.snp.makeConstraints { make in
//      make.leading.equalTo(snp.leadingMargin)
//      make.trailing.equalTo(snp.trailingMargin)
//      make.top.equalTo(titleLabel.snp.bottom).offset(4)
//    }
//    buttonsStackView.snp.makeConstraints { make in
//      make.top.equalTo(subtitleLabel.snp.bottom).offset(16)
//      make.leading.equalTo(snp.leadingMargin)
//      make.trailing.equalTo(snp.trailingMargin)
//    }
//    footerView = addFooter()
//    footerView.helpLinkButton.typographyTitle = S.HelpLink.text
  }
}
