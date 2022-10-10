//
//  ViewController.swift
//  CandleShop
//
//  Created by Александра on 04.10.2022.
//

import UIKit
import SnapKit

class ProductViewModel: UIViewController {
  
  private lazy var rootView: ProductView = .init()


  override func loadView() {
    view = rootView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = K.Colors.background
    createView()
  }

  private func createView(){
    self.navigationController?.isNavigationBarHidden = true
    //self.present(SaleViewController(), animated: true, completion: nil)
   // moveScreen(controller: SaleViewController())
    //rootView.year = 2
   // rootView.subtitleLabel.text = "опоп"
  }



}
