//
//  HomeVC.swift
//  CloneWatchaPedia
//
//  Created by 요한 on 2020/12/15.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {

  fileprivate let menuBar: MenuBar = {
    let menuBar = MenuBar()
    return menuBar
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    setNavigation()
    setMenuBar()
  }
  
  fileprivate func setNavigation() {
    UINavigationBar.appearance().barTintColor = .white
  }
  
  fileprivate func setMenuBar() {
    view.addSubview(menuBar)
    
    menuBar.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(50)
    }
  }
}

