//
//  ViewController.swift
//  CandleShop
//
//  Created by Александра on 04.10.2022.
//

import UIKit
import SnapKit

protocol NavigationDelegate {

  func present(controller: UIViewController) //тут прописываем переменные которые хотим передать в контроллер
  }

class CatalogViewModel: UIViewController, NavigationDelegate {
  func present(controller: UIViewController) {
    self.present(controller, animated: true, completion: nil)
  }

  private lazy var rootView: CatalogViewController = .init()
  

  override func loadView() {
    view = rootView
    rootView.delegate = self
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
