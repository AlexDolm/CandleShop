//
//  CatalogView.swift
//  CandleShop
//
//  Created by Александра on 05.10.2022.
//

import Foundation
import UIKit
//import SnapKit


class CatalogView: UIView {
  public let songs = ["Hit the lights","Safe and sound","Shut up and dance","Cake","Tonight","Sweet Bitter","Lush life","Ocean drive ","Shake it off","Reality","Sweet Babe"]

  public let autors = ["Selena Gomez","Capital cities","Walk The Moon","DNCE","Daniel Blume","Kush Kush","Zara Larsson","Duke Dumont","Taylor Swift","Lost frequencies","HDMI"]

  let indetifireCell = "catalogCell"

  let sections = ["Свечи", "Диффузоры", "Наборы"]

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

  public lazy var view: UIView = {
    let view = UIView()
    view.backgroundColor = .black
    view.translatesAutoresizingMaskIntoConstraints = false
    addSubview(view)
    return view
  }()

  public lazy var pickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(pickerView)
    let rotationAngle = -90 * (CGFloat.pi/180)
    pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
    pickerView.backgroundColor = .black
    return pickerView
  }()

  public lazy var catalogTableView: UITableView = {
    let tableView = UITableView()
    tableView.backgroundColor = .black
    tableView.separatorColor = .black
    tableView.showsVerticalScrollIndicator = false
    tableView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(tableView)
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: indetifireCell)
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

    pickerView.delegate = self
    pickerView.dataSource = self

    logoView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(safeAreaLayoutGuide.snp.top)
      make.height.equalTo(50)
      make.width.equalTo(30)
    }

    view.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.top.equalTo(logoView.snp.bottom)
      make.height.equalTo(50)
    }



    
    pickerView.snp.makeConstraints { make in
      make.top.equalTo(-820)
      make.bottom.equalTo(820)
      make.width.equalTo(50)
      make.centerX.equalToSuperview()
    }

    arrowView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(view.snp.bottom).offset(-8)
    }

    catalogTableView.snp.makeConstraints { make in
      make.right.equalToSuperview()
      make.left.equalToSuperview()
      make.top.equalTo(arrowView.snp.bottom)
      make.bottom.equalToSuperview()
    }
  }
}

extension CatalogView: UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }

  //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //        self.navigationController?.pushViewController(PlayerViewController(), animated: true)
  //    }
}

extension CatalogView: UITableViewDataSource{
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return songs.count

  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell = tableView.dequeueReusableCell(withIdentifier: indetifireCell)
    cell = UITableViewCell(style: .subtitle, reuseIdentifier: indetifireCell)
    cell?.backgroundColor = backgroundColor
    cell?.textLabel?.textColor = .lightGray
    cell?.detailTextLabel?.textColor = .blue
    cell?.selectionStyle = .none
    var itemSong: String
    var itemAutor: String

    itemSong = songs[indexPath.row]
    itemAutor = autors[indexPath.row]

    cell?.textLabel?.text = itemSong
    cell?.detailTextLabel?.text = itemAutor
    cell?.imageView?.image =  #imageLiteral(resourceName: "logo")
    return cell!
  }
}

extension CatalogView: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    1
  }

  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    sections.count
  }
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    return 150
  }

  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
    let label = UILabel()
    label.textAlignment = .center
    label.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
    label.text = sections[row]
    view.addSubview(label)
    label.textColor = .white
    label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
    label.snp.makeConstraints { make in
      make.top.bottom.right.left.equalToSuperview()
    }
    view.transform = CGAffineTransform(rotationAngle: 90 * (CGFloat.pi/180))

    return view
  }

}
