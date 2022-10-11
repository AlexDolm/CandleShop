//
//  CatalogView.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit
//import SnapKit




enum Categories: String, CaseIterable {
  case candles = "Свечи"
  case diffusers = "Диффузоры"
  case sets = "Наборы"
}

class CatalogView: UIView {

  var delegate: NavigationDelegate?
  public var songs = ["Hit the lights","Safe and sound","Shut up and dance","Cake","Tonight","Sweet Bitter","Lush life","Ocean drive ","Shake it off","Reality","Sweet Babe"]

  public var autors = ["Selena Gomez","Capital cities","Walk The Moon","DNCE","Daniel Blume","Kush Kush","Zara Larsson","Duke Dumont","Taylor Swift","Lost frequencies","HDMI"]

  private let indetifireCell = "catalogCell"

  //  var year:Int = 1
  //  {
  //    willSet{
  //      print("старое значение - \(self.year)") //берем старое - текущее значение
  //      print("новое значение - \(newValue)") //берем новое значение
  //    }
  //
  //    didSet{
  //      print("текущее значение - \(self.year)")
  //    }
  //
  //  }

  public lazy var logoView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = K.Images.logo
    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    return imageView
  }()

  public lazy var arrowView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(systemName: "chevron.compact.down")
    imageView.tintColor = .white
    imageView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(imageView)
    return imageView
  }()

  public lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width + 300, height: 30)
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.showsHorizontalScrollIndicator = false
    addSubview(scrollView)
    return scrollView
  }()

  public lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fill
    //stackView.spacing = 12
    stackView.translatesAutoresizingMaskIntoConstraints = false
   // stackView.layoutMargins = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
   // stackView.isLayoutMarginsRelativeArrangement = true

    return stackView
  }()

  private lazy var sectionButtons: [UIButton] = {
    var buttonArray = [UIButton]()
    var tag = 1
    for item in Categories.allCases {
      let button = UIButton()
      button.tag = tag
      tag += 1
      button.setTitle(item.rawValue, for: .normal)
      button.setTitleColor(UIColor.lightGray, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
     button.addTarget(self, action:#selector(selectButton), for: .touchUpInside)
     button.translatesAutoresizingMaskIntoConstraints = false
     button.snp.makeConstraints { make in
       make.width.equalTo(150)
     }
      buttonArray.append(button)
      changeButton(button:buttonArray[0])
    }
    return buttonArray
  }()

  @objc func selectButton(sender: UIButton){
    for button in sectionButtons {
      button.setTitleColor(UIColor.lightGray, for: .normal)
      button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
    }
    changeButton(button: sender)
    switch sender.tag{
    case 1:
      scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
      changeDataCandles()
    case 2:
      scrollView.setContentOffset(CGPoint(x: 150, y: 0), animated: true)
      changeDataDiffusers()
//      CatalogCell.imageq = UIImage(named: "coconat")
//      catalogTableView.reloadData()
    default:
      scrollView.setContentOffset(CGPoint(x: 300, y: 0), animated: true)
      changeDataSets()
    }
  }

  func changeButton(button: UIButton){
    button.setTitleColor(UIColor.white, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
  }


  public lazy var catalogTableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = K.Colors.background
    tableView.separatorColor = K.Colors.background
    tableView.showsVerticalScrollIndicator = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(tableView)
    tableView.register(CatalogCell.self, forCellReuseIdentifier: CatalogCell.indetifireCell)
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
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
      make.centerX.equalToSuperview()
      make.top.equalTo(safeAreaLayoutGuide.snp.top)
      make.height.equalTo(36)
      make.width.equalTo(36)
    }

    scrollView.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.top.equalTo(logoView.snp.bottom).offset(8)
      make.height.equalTo(30)
    }

    scrollView.addSubview(stackView)

    stackView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.left.equalTo(scrollView.snp.centerX).offset(-75)
      make.height.equalTo(30)
    }

    for button in sectionButtons {
      stackView.addArrangedSubview(button)
    }

    arrowView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(scrollView.snp.bottom).offset(-8)
    }

    catalogTableView.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.top.equalTo(arrowView.snp.bottom).offset(10)
      make.bottom.equalToSuperview()
    }
  }

  func changeDataCandles(){

    songs = ["Hit the lights","Safe and sound","Shut up and dance","Cake","Tonight","Sweet Bitter","Lush life","Ocean drive ","Shake it off","Reality","Sweet Babe"]
    autors = ["Selena Gomez","Capital cities","Walk The Moon","DNCE","Daniel Blume","Kush Kush","Zara Larsson","Duke Dumont","Taylor Swift","Lost frequencies","HDMI"]
    catalogTableView.reloadData()
  }
  func changeDataDiffusers(){

    songs = ["Selena Gomez","Capital cities","Walk The Moon","DNCE","Daniel Blume","Kush Kush","Zara Larsson","Duke Dumont","Taylor Swift","Lost frequencies","HDMI"]
    autors =     ["Hit the lights","Safe and sound","Shut up and dance","Cake","Tonight","Sweet Bitter","Lush life","Ocean drive ","Shake it off","Reality","Sweet Babe"]
    catalogTableView.reloadData()
  }
  func changeDataSets(){

    songs = ["Hit the lights","Safe and sound","Shut up and dance","Cake","Tonight","Sweet Bitter","Lush life","Ocean drive ","Shake it off","Reality","Sweet Babe"]
    autors = ["Selena Gomez","Capital cities","Walk The Moon","DNCE","Daniel Blume","Kush Kush","Zara Larsson","Duke Dumont","Taylor Swift","Lost frequencies","HDMI"]
    catalogTableView.reloadData()
  }
}

extension CatalogView: UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 290
  }

      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        self.delegate?.present(controller: ProductViewModel())
       // catalog.moveScreen(controller: SaleViewController())
//         self.navigationController?.pushViewController(SaleViewController(), animated: true)
      }
}

extension CatalogView: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songs.count

  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: CatalogCell.indetifireCell, for: indexPath)

//    cell = UITableViewCell(style: .subtitle, reuseIdentifier: indetifireCell)
//    cell?.backgroundColor = backgroundColor
//    cell?.textLabel?.textColor = .lightGray
//    cell?.detailTextLabel?.textColor = .blue
//    cell?.selectionStyle = .none
//    var itemSong: String
//    var itemAutor: String
//
//    itemSong = songs[indexPath.row]
//    itemAutor = autors[indexPath.row]
//
//    cell?.textLabel?.text = itemSong
//    cell?.detailTextLabel?.text = itemAutor
//    cell?.imageView?.image =  #imageLiteral(resourceName: "logo")
    return cell
  }
}
