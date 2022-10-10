//
//  Constants.swift
//  CandleShop
//
//  Created by Александра on 04.10.2022.
//

import Foundation
import UIKit

class K {
  class Colors {
    static let lightBlue = UIColor(named: "lightBlue")
    static let lightPurple = UIColor(named: "lightPurple")
    static let background = UIColor(named: "background")
    static let darkBackground = UIColor(named: "darkBackground")
    static let lightBackground = UIColor(named: "lightBackground")

    static let title = UIColor(named: "title")
    static let subtitle = UIColor(named: "subtitle")
    static let tint = UIColor(named: "tint")
  }
  class Images {
    static let logo = UIImage(named: "logo")!
    static let logoText = UIImage(named: "logoText")!
    static let love = UIImage(named: "love")!
  }
  class Api {
    static let clientId = "a2f139be"
    static let baseUrl = "https://api.jamendo.com/v3.0"
  }
  class Strings {
    static let candle = "Свечи"
  }
}
