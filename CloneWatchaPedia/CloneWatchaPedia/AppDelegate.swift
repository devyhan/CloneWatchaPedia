//
//  AppDelegate.swift
//  CloneWatchaPedia
//
//  Created by 요한 on 2020/12/15.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let tabBarController = UITabBarController()
    
    let homeVC = HomeVC()
    let searchVC = SearchVC()
    let evaluateVC = EvaluateVC()
    let newsVC = NewsVC()
    let profileVC = ProfileVC()
    
    homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill") , tag: 0)
    searchVC.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass") , tag: 1)
    evaluateVC.tabBarItem = UITabBarItem(title: "평가", image: UIImage(systemName: "star.fill") , tag: 2)
    newsVC.tabBarItem = UITabBarItem(title: "소식", image: UIImage(systemName: "ellipses.bubble.fill") , tag: 3)
    profileVC.tabBarItem = UITabBarItem(title: "나의찾기", image: UIImage(systemName: "person.fill") , tag: 4)
    tabBarController.viewControllers = [homeVC, searchVC, evaluateVC, newsVC, profileVC]
    
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UINavigationController(rootViewController: tabBarController)
    window?.makeKeyAndVisible()
    
    return true
  }
}

