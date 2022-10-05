//
//  ViewController.swift
//  CandleShop
//
//  Created by Александра on 04.10.2022.
//

import UIKit
import SnapKit

class CatalogViewController: UIViewController {
  private lazy var rootView: CatalogView = .init()
  

  override func loadView() {
    view = rootView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .black
    createView()
  }

  private func createView(){
    self.navigationController?.isNavigationBarHidden = true
    //rootView.year = 2
   // rootView.subtitleLabel.text = "опоп"
  }




}
