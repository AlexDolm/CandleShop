//
//  Extension+CatalorViewController.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit

extension CatalogViewController {

  func addIconToNavBar() {
    if navigationController != nil {
      let imageLogo = UIImage(named: "logo")
      let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
      let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 30))
      imageView.image = imageLogo
      logoContainer.addSubview(imageView)
      navigationItem.titleView = logoContainer
    }
  }
  
}
