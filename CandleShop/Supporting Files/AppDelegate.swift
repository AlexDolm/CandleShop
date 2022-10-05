//
//  AppDelegate.swift
//  Halio
//
//  Created by Кирилл on 20.09.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

      var views: [UINavigationController] = []

      views.append(getCatalogView())
      views.append(getSaleView())
      views.append(getBasketView())
      views.append(getOrdersView())
      views.append(getPersonalView())

      let tabBarVC = UITabBarController()
      tabBarVC.setViewControllers(views, animated: true)

      tabBarVC.tabBar.unselectedItemTintColor = .white
      UITabBar.appearance().tintColor = K.C.lightPurple


      let window = UIWindow(frame: UIScreen.main.bounds)
      window.rootViewController = tabBarVC
      window.makeKeyAndVisible()

      self.window = window

      return true
    }

    func getCatalogView() -> UINavigationController {
        let favoriteView = CatalogViewController()
        favoriteView.tabBarItem = UITabBarItem(title: "Каталог", image: UIImage(systemName: "flame.fill"), tag: 0)
        return UINavigationController(rootViewController: favoriteView)

    }

    func getSaleView() -> UINavigationController {
        let homeView = SaleViewController()
        homeView.tabBarItem = UITabBarItem(title: "Акции", image: UIImage(systemName: "percent"), tag: 1)
      homeView.tabBarItem.badgeColor = .green
        return UINavigationController(rootViewController: homeView)

    }

    func getBasketView() -> UINavigationController {
        let searchView = CatalogViewController()
        searchView.tabBarItem = UITabBarItem(title: "Корзина", image: UIImage(systemName: "cart.fill"), tag: 2)
        return UINavigationController(rootViewController: searchView)

    }

    func getOrdersView() -> UINavigationController {
        let profileView = CatalogViewController()
        profileView.tabBarItem = UITabBarItem(title: "Заказы", image: UIImage(systemName: "bag.fill"), tag: 3)
        return UINavigationController(rootViewController: profileView)

    }

  func getPersonalView() -> UINavigationController {
      let profileView = CatalogViewController()
      profileView.tabBarItem = UITabBarItem(title: "Личное", image: UIImage(systemName: "ellipsis"), tag: 3)
      return UINavigationController(rootViewController: profileView)

  }

}

